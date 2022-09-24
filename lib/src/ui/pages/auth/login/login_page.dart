import 'dart:convert' show json;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import '../../../../data/models/ui/page_arguments.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/route_constants.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/log_utils.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../../utils/themes/theme_maps.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/general/general_bloc.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../otp/login_verify_phone_page.dart';
import 'components/components.dart';

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
    _emailController.text = 'user10@gmail.com';
    _phoneController = TextEditingController();
    _phoneController.text = '0949412112';
    _passwordController = TextEditingController();
    _passwordController.text = 'Cena@123';
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
    final lang = S.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingAuthState) {
          modalLoading(context);
        } else if (state is FailureAuthState) {
          _catchAuthError(context, state, lang);
        } else if (state.rolId != '') {
          _loginSuccessLogic(BlocProvider.of<UserBloc>(context), state,
              BlocProvider.of<StoreBloc>(context), context);
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
              _buildHeader(context, widget),
              const SizedBox(height: 10.0),
              Image.asset('Assets/Logo/logo-black.png', height: 140),
              const SizedBox(height: 10.0),
              _buildSwitchButton(context),
              const SizedBox(height: 20.0),
              _loginType == LoginType.byPhone
                  ? _buildPhoneForm()
                  : _buildEmailForm(),
              _buildDivide(context),
              CenaButton(
                text: S.of(context).login_register,
                fontWeight: FontWeight.w500,
                textColor: CenaColors.WHITE,
                height: 47,
                color: Theme.of(context).highlightColor,
                fontSize: 16,
                onPressed: () => NavigationUtils.push(
                    context, RouteConstants.register,
                    args: PageArguments(
                        transitionType: PageTransitionType.rightToLeft)),
              ),
              const SizedBox(height: 20),
              _buildSocialButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  void _loginSuccessLogic(UserBloc userBloc, AuthState state,
      StoreBloc storeBloc, BuildContext context) {
    userBloc.add(OnGetUserEvent(state.user!));
    if (state.store != null) {
      storeBloc.add(OnGetStoreEvent(state.store!));
    }
    NavigationUtils.pop(context);

    if (state.rolId == '1') {
      NavigationUtils.replace(context, RouteConstants.admin_home,
          args: PageArguments(transitionType: PageTransitionType.bottomToTop));
    } else if (state.rolId == '3') {
      NavigationUtils.clearStack(context,
          newRouteName: RouteConstants.delivery_home);
    } else if (state.rolId == '2') {
      final userBloc = BlocProvider.of<UserBloc>(context);
      if (userBloc.state.address == null) {
        userBloc.add(OnInitialCurrentAddressEvent(
            state.user!.id,
            state.user!.firstName + " " + state.user!.lastName,
            state.user!.phone));
      }
      NavigationUtils.clearStack(context,
          newRouteName: RouteConstants.client_home);
    }
  }

  void _catchAuthError(BuildContext context, FailureAuthState state, S lang) {
    NavigationUtils.pop(context);

    switch (state.error) {
      case "error_session_expire":
        cenaToastError(lang.login_error_wrong);
        break;
      default:
        cenaToastError(lang.login_error_server);
    }
  }

  void setStateLoginType(LoginType loginTypeState) {
    setState(() {
      _loginType = loginTypeState;
    });
  }

  Widget _buildHeader(BuildContext context, Widget loginWidget) {
    GlobalKey changeThemeKey = GlobalKey();
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginLanguageOptions(context: context),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const AppName(),
              LoginChangeThemeButton(
                  key: changeThemeKey,
                  myThemeKey: MyThemes.instance.currentThemeKey,
                  parrentWidget: loginWidget),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchButton(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .hintColor
              .withOpacity(AppConstants.color_opacity),
          border: Border.all(
              color: Theme.of(context).primaryColorLight, width: 0.0),
          borderRadius: BorderRadius.circular(AppConstants.border_radius),
        ),
        child: ToggleButtons(
          fillColor: CenaColors.primary,
          color: Theme.of(context).primaryColorDark,
          selectedColor: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(AppConstants.border_radius),
          borderWidth: 0.0,
          borderColor: Theme.of(context).primaryColorLight,
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
              LogUtils.debug("LoginPage", "_buildSwitchButton",
                  "User choose LoginType.byPhone");
            } else {
              setStateLoginType(LoginType.byEmail);
              LogUtils.debug("LoginPage", "_buildSwitchButton",
                  "User choose LoginType.byEmail");
            }
          },
          isSelected: [
            _loginType == LoginType.byPhone,
            _loginType == LoginType.byEmail
          ],
        ),
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
                  // const SizedBox(height: 5.0),
                  // CenaTextDescription(text: S.of(context).login_password),
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
                          onTap: () => NavigationUtils.push(
                              context, RouteConstants.forgot_password,
                              args: PageArguments(
                                  transitionType:
                                      PageTransitionType.bottomToTop)),
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
                      LogUtils.debug(
                        'LoginPage',
                        'Login Button Press',
                        "Pressed",
                      );
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

  Widget _buildDivide(BuildContext context) {
    final _theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(height: 1, width: 150, color: _theme.primaryColorDark),
        CenaTextDescription(
          text: S.of(context).login_or,
          fontSize: 16,
          color: _theme.primaryColorDark,
        ),
        Container(height: 1, width: 150, color: _theme.primaryColorDark)
      ],
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Column(
      children: [
        LoginButtonSocial(
          icon: Icon(FontAwesomeIcons.google,
              color: Theme.of(context).primaryColorLight),
          text: S.of(context).login_with_google,
          textColor: Theme.of(context).primaryColorLight,
          backgroundColor: const Color.fromARGB(255, 241, 68, 54),
          isBorder: false,
          onPressed: _loginWithGoogle,
        ),
        const SizedBox(
          height: 5,
        ),
        LoginButtonSocial(
          icon: Icon(
            FontAwesomeIcons.facebook,
            color: Theme.of(context).primaryColorLight,
          ),
          text: S.of(context).login_with_facebooK,
          backgroundColor: const Color.fromARGB(255, 56, 92, 142),
          textColor: Theme.of(context).primaryColorLight,
          onPressed: _loginWithFacebook,
          isBorder: false,
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
}
