part of './component.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordRepeatController;
  final _keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();
    _passwordController.clear();
    _passwordController.dispose();
    _passwordRepeatController.clear();
    _passwordRepeatController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
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
                    hintText: "New Password",
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
                  CenaInputPasswordShow(
                    controller: _passwordRepeatController,
                    isPassword: state.isShowPassword,
                    hintText: "Repeat Password",
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
                  ElevatedButton(
                    child: Text(S.of(context).register_button),
                    onPressed: () {
                      LogUtils.debug(
                        'Register Page',
                        'Register with email',
                        "Pressed",
                      );
                      if (_keyForm.currentState!.validate()) {
                        userBloc.add(OnRegisterClientEvent(
                            "",
                            "",
                            "",
                            _emailController.text,
                            _passwordController.text,
                            ""));
                      }
                    },
                  ),
                ],
              ),
            ));
  }
}
