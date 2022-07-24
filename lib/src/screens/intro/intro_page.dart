import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../configs/cena_colors.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import '../auth/login/login_page.dart';
import '../auth/register_client_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CenaTextDescription(
                text: 'Cena ',
                color: Color(0xff0C6CF2),
                fontWeight: FontWeight.w500,
                fontSize: 25),
            CenaTextDescription(
                text: 'Foodie', fontSize: 25, fontWeight: FontWeight.w500),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              height: 350,
              width: size.width,
              child: SvgPicture.asset('Assets/delivery.svg'),
            ),
            Column(
              children: [
                const _BtnSocial(
                  icon: FontAwesomeIcons.google,
                  text: 'Sign up with Google',
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  isBorder: true,
                ),
                const SizedBox(height: 15.0),
                const _BtnSocial(
                  icon: FontAwesomeIcons.facebook,
                  text: 'Sign up with Facebook',
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 15.0),
                _BtnSocial(
                  icon: FontAwesomeIcons.envelope,
                  text: 'Sign up with an Email ID',
                  backgroundColor: CenaColors.GREEN,
                  textColor: Colors.white,
                  onPressed: () => Navigator.push(
                      context, routeCena(page: const RegisterClientPage())),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: 1, width: 150, color: Colors.grey[300]),
                    const CenaTextDescription(
                      text: 'Or',
                      fontSize: 16,
                    ),
                    Container(height: 1, width: 150, color: Colors.grey[300])
                  ],
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CenaButton(
                    text: 'Login',
                    fontWeight: FontWeight.w500,
                    borderRadius: 10.0,
                    height: 50,
                    fontSize: 20,
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const LoginPage())),
                  ),
                ),
                const SizedBox(height: 20.0)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BtnSocial extends StatelessWidget {
  final IconData icon;
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: backgroundColor,
              border:
                  isBorder ? Border.all(color: Colors.grey, width: .7) : null,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              const SizedBox(width: 30.0),
              Icon(icon, color: isBorder ? Colors.black87 : Colors.white),
              const SizedBox(width: 20.0),
              CenaTextDescription(text: text, color: textColor, fontSize: 17)
            ],
          ),
        ),
      ),
    );
  }
}
