import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login/login_page.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../widgets/animation_route.dart';
import 'package:android_intent_plus/android_intent.dart';
import '../../widgets/widgets.dart';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 90.0),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          color: CenaColors.primary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Icon(FontAwesomeIcons.envelopeOpenText,
                          size: 60, color: CenaColors.primary),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CenaTextDescription(
                      text: 'Check your mail',
                      textAlign: TextAlign.center,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                  const SizedBox(height: 20.0),
                  const CenaTextDescription(
                      text:
                          'We have send a password recover instructions to your email.',
                      maxLine: 2,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 40.0),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: CenaButton(
                        text: 'Open email App',
                        fontWeight: FontWeight.w500,
                        onPressed: () async {
                          if (Platform.isAndroid) {
                            const intent = AndroidIntent(
                                action: 'action_view',
                                package: 'com.android.email');
                            intent.launch();
                          }
                        },
                      )),
                  const SizedBox(height: 40.0),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context, routeCena(page: const LoginPage())),
                          child: const CenaTextDescription(
                              text: 'Skip, I\'ll confirm later'))),
                  const SizedBox(height: 20.0),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: const CenaTextDescription(
                      text:
                          'Did not receive the email? Check your spam filter.',
                      color: Colors.grey,
                      maxLine: 2)),
            ],
          ),
        ),
      ),
    );
  }
}
