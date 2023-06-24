part of './component.dart';

class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key}) : super(key: key);

  @override
  State<RegisterPhone> createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordRepeatController;
  final _keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.clear();
    _phoneController.dispose();
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

    final validatedPhoneForm = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_phone_required),
      MinLengthValidator(10,
          errorText: lang.auth_registry_error_phone_must_10_digits)
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
                  CenaNumberField(
                    maxLength: 50,
                    controller: _phoneController,
                    hintText: S.of(context).login_phone,
                    validator: validatedPhoneForm,
                  ),
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
                        'Register with pphone',
                        "Pressed",
                      );
                      if (_keyForm.currentState!.validate()) {
                        userBloc.add(OnRegisterClientEvent(
                            "",
                            "",
                            "",
                            _phoneController.text,
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
