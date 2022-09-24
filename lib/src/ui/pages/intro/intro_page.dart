import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/configs/cena_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import '../auth/login/login_page.dart';
import '../auth/register/register_client_page.dart';
import 'components/intro_social_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMainIcon(context),
            _buildGroupButton(context),
          ],
        ),
      ),
    );
  }

  ///Build app bar
  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          CenaTextDescription(
              text: AppConstants.companyName,
              color: Color(0xff0C6CF2),
              fontWeight: FontWeight.w500,
              fontSize: 25),
          CenaTextDescription(
              text: AppConstants.appName,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0,
    );
  }

  Widget _buildMainIcon(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: SvgPicture.asset('Assets/delivery.svg'),
    );
  }

  Widget _buildGroupButton(BuildContext context) {
    return Column(
      children: [
        const IntroSocialButton(
          icon: FontAwesomeIcons.google,
          text: 'Sign up with Google',
          textColor: Colors.white,
          backgroundColor: Colors.grey,
          isBorder: true,
        ),
        const SizedBox(height: 15.0),
        const IntroSocialButton(
          icon: FontAwesomeIcons.facebook,
          text: 'Sign up with Facebook',
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        ),
        const SizedBox(height: 15.0),
        IntroSocialButton(
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
            onPressed: () =>
                Navigator.push(context, routeCena(page: const LoginPage())),
          ),
        ),
        const SizedBox(height: 20.0)
      ],
    );
  }
}
