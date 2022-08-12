import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../utils/configs/cena_colors.dart';
import '../../resources/generated/l10n.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import 'check_email_page.dart';
import 'login/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    final validatedEmail = MultiValidator([
      RequiredValidator(errorText: lang.auth_registry_error_email_required),
      EmailValidator(errorText: lang.auth_registry_error_email_invalid)
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CenaTextDescription(
            text: 'Reset Password', fontSize: 21, fontWeight: FontWeight.w500),
        centerTitle: true,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () => Navigator.pushReplacement(
              context, routeCena(page: const LoginPage())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios_new_rounded,
                  size: 18, color: CenaColors.primary),
              CenaTextDescription(
                  text: 'Back', color: CenaColors.primary, fontSize: 18)
            ],
          ),
        ),
        actions: const [Icon(Icons.help_outline_outlined)],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              const CenaTextDescription(
                text:
                    'Enter the email associated with your account and well send an email with instruccions to reset your password.',
                maxLine: 4,
                color: Color(0xff5B6589),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30.0),
              const CenaTextDescription(text: 'Email Address'),
              const SizedBox(height: 5.0),
              CenaFormField(
                controller: _emailController,
                hintText: 'example@frave.com',
                validator: validatedEmail,
              ),
              const SizedBox(height: 30.0),
              CenaButton(
                text: 'Send Instructions',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                onPressed: () {
                  // if( _formKey.currentState!.validate() ){}
                  Navigator.push(
                      context, routeCena(page: const CheckEmailPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
