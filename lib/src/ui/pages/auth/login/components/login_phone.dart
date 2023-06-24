part of './components.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  late TextEditingController _phoneController;
  @override
  void initState() {
    _phoneController = TextEditingController();
    _phoneController.text = '0949412112';
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.clear();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CenaNumberField(
            maxLength: 11,
            controller: _phoneController,
            hintText: S.of(context).login_phone_number_hintext,
            validator: validatedPhoneForm,
          ),
          const SizedBox(height: 50.0),
          ElevatedButton(
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
              child: Text(S.of(context).login_phone_otp)),
        ],
      ),
    );
  }
}
