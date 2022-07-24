import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/store/store_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../configs/cena_colors.dart';
import '../../configs/cena_text_styles.dart';
import '../../generated/l10n.dart';
import '../../helpers/helpers.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/loading_more_row_widget.dart';
import '../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../widgets/widgets.dart';
import '../Admin/admin_home_page.dart';
import '../client/client_get_current_address_page.dart';
import '../client/client_home_page.dart';
import '../delivery/delivery_home_page.dart';
import 'enter_references_page.dart';
import 'register_client_page.dart';

enum authProblems { userNotFound, passwordNotValid, networkError }

class LoginVerifyOtpPage extends StatefulWidget {
  final String phoneNumber;
  final bool isFromRegistry;

  const LoginVerifyOtpPage(
      {required this.phoneNumber, this.isFromRegistry = false, Key? key})
      : super(key: key);

  @override
  _LoginVerifyOtpPageState createState() => _LoginVerifyOtpPageState();
}

class _LoginVerifyOtpPageState extends State<LoginVerifyOtpPage> {
  TextEditingController textEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool hasError = false;
  String currentText = "";
  bool _isLoading = true;
  String _verificationId = "";

  Timer? _timer;
  int _start = 60;

  void restartTimer() {
    setState(() {
      _start = 60;
    });
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  StreamController<ErrorAnimationType>? errorController;

  void _verifyOTP(String otp) async {
    try {
      if (kDebugMode) {
        final authBloc = BlocProvider.of<AuthBloc>(context);
        authBloc.add(LoginPhoneEvent(widget.phoneNumber));
        return;
      }
      await _auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationId, smsCode: otp))
          .then((value) async {
        if (value.user != null) {
          final authBloc = BlocProvider.of<AuthBloc>(context);
          authBloc.add(LoginPhoneEvent(widget.phoneNumber));
        }
      });
      // }
    } on FirebaseAuthException catch (e) {
      Future.delayed(Duration.zero, () {
        final lang = S.of(context);
        switch (e.code) {
          case "invalid-verification-code":
            cenaToastError(lang.auth_verify_phone_error_invalid_otp);
            break;
          case "session-expired":
            cenaToastError(lang.auth_verify_phone_error_expired);
            break;
          default:
            cenaToastError(lang.auth_verify_phone_error_server_otp);
            break;
        }
      });
    }
  }

  Future<void> _verifyPhone() async {
    try {
      // if (kDebugMode) {
      //   startTimer();
      //   setState(() {
      //     _verificationId = "";
      //     _isLoading = false;
      //   });
      // } else {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+84${widget.phoneNumber}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential).then((value) async {
              if (value.user != null) {
                textEditingController.text = credential.smsCode!;
              }
            });
          },
          verificationFailed: (FirebaseAuthException e) {
            Future.delayed(Duration.zero, () {
              final lang = S.of(context);
              if (e.code == 'invalid-phone-number') {
                cenaToastError(lang.auth_verify_phone_error_invalid_phone);
              } else if (e.code == 'session-expired') {
                cenaToastError(lang.auth_verify_phone_error_expired);
              } else if (e.code == 'too-many-requests') {
                cenaToastError(lang.auth_verify_phone_error_too_many_request);
              } else {
                cenaToastError(e.message!);
              }
              setState(() {
                _isLoading = false;
              });
              startTimer();
            });
          },
          // forceResendingToken:,
          codeSent: (String verficationID, int? resendToken) async {
            startTimer();
            _verificationId = verficationID;
            setState(() {
              _isLoading = false;
            });
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            setState(() {
              _isLoading = false;
            });
          },
          timeout: const Duration(seconds: 120));
      // }
    } on FirebaseAuthException catch (e) {
      cenaToastError(e.message!);
    }
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _verifyPhone();
    super.initState();
  }

  @override
  void dispose() {
    try {
      errorController!.close();
      _timer!.cancel();
      // ignore: empty_catches
    } catch (e) {}

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final storeBloc = BlocProvider.of<StoreBloc>(context);
    final lang = S.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingAuthState) {
          modalLoading(context);
        } else if (state is FailureAuthState) {
          Navigator.pop(context);
          if (state.error == "Phone not exsit") {
            Navigator.pushReplacement(context,
                routeCena(page: RegisterClientPage(phone: widget.phoneNumber)));
          } else {
            cenaToastError(state.error);
          }
        } else {
          if (state.rolId != '') {
            userBloc.add(OnGetUserEvent(state.user!));
            storeBloc.add(OnGetStoreEvent(state.store!));
            Navigator.pop(context);

            if (state.rolId == '1') {
              Navigator.pushAndRemoveUntil(context,
                  routeCena(page: const AdminHomePage()), (route) => false);
            } else if (state.rolId == '2') {
              final userBloc = BlocProvider.of<UserBloc>(context);
              if (widget.isFromRegistry) {
                Navigator.pushAndRemoveUntil(
                    context,
                    routeCena(page: const EnterReferencePage()),
                    (route) => false);
              } else if (userBloc.state.address == null) {
                userBloc.add(OnInitialCurrentAddressEvent(
                    state.user!.uid!,
                    state.user!.firstName! + " " + state.user!.lastName!,
                    state.user!.phone!));
                Navigator.pushAndRemoveUntil(
                    context,
                    routeCena(page: const ClientGetCurrentAddressPage()),
                    (route) => false);
              } else {
                Navigator.pushAndRemoveUntil(context,
                    routeCena(page: const ClientHomePage()), (route) => false);
              }
            } else if (state.rolId == '3') {
              Navigator.pushAndRemoveUntil(context,
                  routeCena(page: const DeliveryHomePage()), (route) => false);
            }
          }
        }
      },
      child: Scaffold(
        appBar: CenaAppbarDefault(
          leading: !_isLoading
              ? const CenaButtonDefaultBack()
              : const SizedBox(
                  width: 10.0,
                ),
          title: lang.auth_verify_phone_title,
        ),
        backgroundColor: CenaColors.WHITE,
        body: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child:
                        Image.asset('Assets/Logo/logo-black.png', height: 130),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    lang.auth_verify_phone_verify_info,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: lang.auth_verify_phone_enter_your_otp,
                        children: [
                          TextSpan(
                              text: widget.phoneNumber,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 6) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (otp) {
                          // _verifyOTP(otp);
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          if (kDebugMode) {
                            print("Allowing to paste $text");
                          }
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    hasError ? lang.auth_verify_phone_enter_full_otp : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10),
                _isLoading
                    ? const LoadingMoreRowWidget()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            lang.auth_verify_phone_did_not_recieve_otp,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 15),
                          ),
                          TextButton(
                              onPressed: _start == 0
                                  ? () => {
                                        restartTimer(),
                                        _verifyPhone(),
                                        setState(() {
                                          _isLoading = true;
                                        })
                                      }
                                  : () {},
                              child: Text(
                                _start > 0
                                    ? "${lang.auth_verify_phone_button_resend} ($_start)"
                                    : lang.auth_verify_phone_button_resend,
                                style: TextStyle(
                                    color: _start == 0
                                        ? CenaColors.primary
                                        : CenaColors.GREY,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ))
                        ],
                      ),
                const SizedBox(height: 10),
                _isLoading
                    ? Center(
                        child: CenaTextDescription(
                          text: lang.auth_verify_phone_please_wait_verify_phone,
                          textStyle: CenaTextStyles.blackS18Bold,
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30),
                        child: ButtonTheme(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              _formKey.currentState!.validate();
                              // conditions for validating
                              if (currentText.length != 6) {
                                errorController!.add(ErrorAnimationType
                                    .shake); // Triggering error shake animation
                                setState(() => hasError = true);
                              } else {
                                setState(
                                  () {
                                    hasError = false;
                                    _verifyOTP(
                                        textEditingController.value.text);
                                  },
                                );
                              }
                            },
                            child: Center(
                                child: Text(
                              lang.auth_verify_phone_button_verify,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.shade200,
                                  offset: const Offset(1, -2),
                                  blurRadius: 5),
                              BoxShadow(
                                  color: Colors.green.shade200,
                                  offset: const Offset(-1, 2),
                                  blurRadius: 5)
                            ]),
                      ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
