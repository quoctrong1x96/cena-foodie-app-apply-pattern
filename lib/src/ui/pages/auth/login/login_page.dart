import 'package:flag/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import '../../../../utils/getx_services/getx_settings_service.dart';
import '../../../../utils/themes/theme_maps.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/general/general_bloc.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../../Admin/admin_home_page.dart';
import '../forgot_password_page.dart';
import '../login_verify_phone_page.dart';
import '../register_client_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginType { byPhone, byEmail, byGoogle, byFacebook }

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  LoginType _loginType = LoginType.byPhone;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    _emailController = TextEditingController();
    _emailController.text = 'cenafoodie@gmail.com';
    _phoneController = TextEditingController();
    _phoneController.text = '0949412112';
    _passwordController = TextEditingController();
    _passwordController.text = 'Cena@1234';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    _phoneController.clear();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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

          switch (state.error) {
            case "Wrong Credentials":
              cenaToastError(lang.login_error_wrong);
              break;
            default:
              cenaToastError(lang.login_error_server);
          }
        } else if (state.rolId != '') {
          userBloc.add(OnGetUserEvent(state.user!));
          storeBloc.add(OnGetStoreEvent(state.store!));
          Navigator.pop(context);

          if (state.rolId == '1') {
            Navigator.pushAndRemoveUntil(context,
                routeCena(page: const AdminHomePage()), (route) => false);
          } else if (state.rolId == '3') {
            // Navigator.pushAndRemoveUntil(context,
            //     routeCena(page: const DeliveryHomePage()), (route) => false);
          } else if (state.rolId == '2') {
            final userBloc = BlocProvider.of<UserBloc>(context);
            if (userBloc.state.address == null) {
              userBloc.add(OnInitialCurrentAddressEvent(
                  state.user!.id,
                  state.user!.firstName + " " + state.user!.lastName,
                  state.user!.phone));
            }
            // Navigator.pushAndRemoveUntil(context,
            //     routeCena(page: const ClientHomePage()), (route) => false);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              _buildAppName(context),
              const SizedBox(height: 10.0),
              Image.asset('Assets/Logo/logo-black.png', height: 140),
              const SizedBox(height: 10.0),
              _buildSwitchButton(context),
              const SizedBox(height: 20.0),
              _loginType == LoginType.byPhone
                  ? _buildPhoneForm()
                  : _buildEmailForm(),
              _buildDivide(),
              CenaButton(
                text: S.of(context).login_register,
                fontWeight: FontWeight.w500,
                textColor: CenaColors.WHITE,
                height: 47,
                color: Theme.of(context).highlightColor,
                fontSize: 16,
                onPressed: () => Navigator.push(
                    context, routeCena(page: const RegisterClientPage())),
              ),
              _buildSocialButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  void setStateLoginType(LoginType loginTypeState) {
    setState(() {
      _loginType = loginTypeState;
    });
  }

  Widget _buildAppName(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLanguagesOption(),
          Row(
            children: [
              CenaTextDescription(
                  text: 'Cena ',
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
              CenaTextDescription(
                  text: 'Foodie',
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w500),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSwitchButton(BuildContext context) {
    return Center(
      child: ToggleButtons(
        fillColor: CenaColors.primary,
        color: CenaColors.GREY,
        selectedColor: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(5),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Icon(
                FontAwesomeIcons.commentSms,
                size: 30,
              ),
              const SizedBox(width: 2),
              Text(S.of(context).login_with_sms)
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(children: [
              const Icon(FontAwesomeIcons.envelope),
              const SizedBox(width: 2),
              Text(S.of(context).login_with_email)
            ]),
          ),
        ],
        onPressed: (int index) {
          if (index == 0) {
            setStateLoginType(LoginType.byPhone);
            _changeTheme(context, MyThemeKeys.dark);
          } else {
            setStateLoginType(LoginType.byEmail);
            _changeTheme(context, MyThemeKeys.light);
          }
        },
        isSelected: [
          _loginType == LoginType.byPhone,
          _loginType == LoginType.byEmail
        ],
      ),
    );
  }

  Widget _buildPhoneForm() {
    final _keyForm = GlobalKey<FormState>();
    final lang = S.of(context);
    final validatedPhoneForm = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_phone_required),
      MinLengthValidator(10,
          errorText: lang.auth_registry_error_phone_must_10_digits)
    ]);

    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CenaTextDescription(text: S.of(context).login_phone),
          const SizedBox(height: 5.0),
          CenaFormField(
            maxLength: 11,
            controller: _phoneController,
            hintText: S.of(context).login_phone_number_hintext,
            keyboardType: TextInputType.number,
            validator: validatedPhoneForm,
          ),
          const SizedBox(height: 10.0),
          CenaButton(
            text: S.of(context).login_phone_otp,
            fontSize: 16,
            height: 50,
            fontWeight: FontWeight.w500,
            onPressed: () {
              if (_keyForm.currentState!.validate()) {
                Navigator.push(
                    context,
                    routeCena(
                        page: LoginVerifyOtpPage(
                      phoneNumber: _phoneController.value.text,
                    )));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmailForm() {
    final _keyForm = GlobalKey<FormState>();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final generalBloc = BlocProvider.of<GeneralBloc>(context);
    final lang = S.of(context);

    final validatedEmail = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_email_required),
      EmailValidator(errorText: lang.auth_registry_error_email_required)
    ]);
    final passwordValidator = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_password_required),
      MinLengthValidator(8,
          errorText: lang.auth_registry_error_password_minimum_10_characters)
    ]);
    return BlocBuilder<GeneralBloc, GeneralState>(
        builder: (context, state) => Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CenaTextDescription(text: S.of(context).login_email),
                  const SizedBox(height: 5.0),
                  CenaFormField(
                    maxLength: 50,
                    controller: _emailController,
                    hintText: S.of(context).login_email,
                    keyboardType: TextInputType.emailAddress,
                    validator: validatedEmail,
                  ),
                  const SizedBox(height: 20.0),
                  CenaTextDescription(text: S.of(context).login_password),
                  const SizedBox(height: 5.0),
                  CenaInputPasswordShow(
                    controller: _passwordController,
                    isPassword: state.isShowPassword,
                    hintText: "********",
                    suffixIcon: IconButton(
                        splashRadius: 20,
                        icon: state.isShowPassword
                            ? const Icon(Icons.visibility_off_rounded)
                            : const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          bool isShowPassword =
                              !generalBloc.state.isShowPassword;
                          generalBloc
                              .add(OnShowOrHidePasswordEvent(isShowPassword));
                        }),
                    validator: passwordValidator,
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () => Navigator.push(context,
                              routeCena(page: const ForgotPasswordPage())),
                          child: CenaTextDescription(
                              text: S.of(context).login_forgot_password,
                              fontSize: 17,
                              color: Theme.of(context).primaryColor))),
                  CenaButton(
                    text: S.of(context).login_login,
                    fontSize: 16,
                    height: 50,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        authBloc.add(LoginEvent(
                            _emailController.text, _passwordController.text));
                      }
                    },
                  ),
                ],
              ),
            ));
  }

  Widget _buildDivide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(height: 1, width: 150, color: Colors.grey[300]),
        CenaTextDescription(
          text: S.of(context).login_or,
          fontSize: 16,
        ),
        Container(height: 1, width: 150, color: Colors.grey[300])
      ],
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Column(
      children: [
        _BtnSocial(
          icon: Icon(FontAwesomeIcons.google,
              color: Theme.of(context).primaryColorLight),
          text: S.of(context).login_with_google,
          textColor: Theme.of(context).primaryColorLight,
          backgroundColor: Colors.lightBlue,
          isBorder: true,
          onPressed: _loginWithGoogle,
        ),
        const SizedBox(
          height: 5,
        ),
        _BtnSocial(
          icon: Icon(
            FontAwesomeIcons.facebook,
            color: Theme.of(context).primaryColorLight,
          ),
          text: S.of(context).login_with_facebooK,
          backgroundColor: Theme.of(context).primaryColorDark,
          textColor: Theme.of(context).primaryColorLight,
          onPressed: _loginWithFacebook,
          isBorder: true,
        ),
      ],
    );
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      if (kDebugMode) {
        print('People API ${response.statusCode} response: ${response.body}');
      }
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    if (kDebugMode) {
      if (namedContact != null) {
        print('I see you know $namedContact!');
      } else {
        print('No contacts to display.');
      }
    }
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _loginWithGoogle() async {
    try {
      GoogleSignInAccount? user;
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
        user = account;
        if (user != null) {
          _handleGetContact(user!);
        }
        _googleSignIn.signInSilently();
      });
      user = await _googleSignIn.signIn();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  void _loginWithFacebook() async {
    // ignore: unused_local_variable
    Map<String, dynamic>? userData;
    AccessToken? _accessToken;
    _accessToken = await FacebookAuth.instance.accessToken;
    if (_accessToken != null) {
      userData = await FacebookAuth.instance.getUserData(
          fields:
              "id,first_name,last_name,middle_name,about,birthday,picture,email,gender,languages,link");
    } else {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken;
        userData = await FacebookAuth.instance.getUserData(
            fields:
                "id,first_name,last_name,middle_name,about,birthday,picture,email,gender,languages,link");
      }
    }
  }

  Widget _buildLanguagesOption() {
    final settingService = Get.find<SettingService>();
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            // icon: const Icon(FontAwesomeIcons.angleDown),
            items: [
              DropdownMenuItem(
                value: const Locale('en'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).login_languages_english),
                    const SizedBox(width: 5.0),
                    const Flag.fromString('us',
                        height: 17, width: 30, fit: BoxFit.fill)
                  ],
                ),
              ),
              DropdownMenuItem(
                value: const Locale('vi'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).login_languages_vietnam),
                    const SizedBox(width: 5.0),
                    const Flag.fromString('vn',
                        height: 17, width: 30, fit: BoxFit.fill)
                  ],
                ),
              ),
            ],
            onChanged: (Locale? value) {
              if (value != null) {
                settingService.updateLocale(value);
              }
            },
            value: settingService.currentLocate.value,
            underline: null,
          ),
        ],
      );
    });
  }
}

class _BtnSocial extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isBorder;

  const _BtnSocial(
      {required this.icon,
      required this.text,
      this.onPressed,
      this.backgroundColor = const Color(0xffF5F5F5),
      this.textColor = Colors.black,
      this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 47,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              border:
                  isBorder ? Border.all(color: Colors.grey, width: .7) : null,
              borderRadius: BorderRadius.circular(1.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30.0),
              icon,
              const SizedBox(width: 50.0),
              CenaTextDescription(text: text, color: textColor, fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}
