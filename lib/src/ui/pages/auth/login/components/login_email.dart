part of './components.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _emailController.text = 'cenafoodie@gmail.com';

    _passwordController = TextEditingController();
    _passwordController.text = 'Cena@123';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();

    _passwordController.clear();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  CenaEmailField(
                    maxLength: 50,
                    controller: _emailController,
                    hintText: S.of(context).login_email,
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
                  ElevatedButton(
                    child: Text(S.of(context).login_login),
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
}
