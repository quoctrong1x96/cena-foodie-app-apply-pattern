import 'package:cenafoodie/src/ui/pages/admin/admin_home_page.dart';
import 'package:cenafoodie/src/ui/pages/auth/enter_references_page.dart';
import 'package:cenafoodie/src/ui/pages/auth/forgot_password_page.dart';
import 'package:cenafoodie/src/ui/pages/auth/login/login_page.dart';
import 'package:cenafoodie/src/ui/pages/auth/login_verify_phone_page.dart';
import 'package:cenafoodie/src/ui/pages/auth/register/register_client_page.dart';
import 'package:cenafoodie/src/ui/pages/intro/checking_login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../data/models/ui/page_arguments.dart';
import 'constants/app_constants.dart';
import 'constants/route_constants.dart';
import 'log_utils.dart';

class RouteUtils {
  const RouteUtils._internal();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Route arguments can be managed here and values for those can be passed to page constructor.
    // If we do not want to pass arguments directly to page constructor and let the particular page
    // handle the arguments itself than we must pass 'settings' as an argument to MaterialPageRoute

    final route = settings.name;
    final args = settings.arguments as PageArguments?;
    LogUtils.debug(
      'RouteUtils',
      'generateRoute',
      '$route, ${args?.toJson()}',
    );

    if (route == RouteConstants.check_login) {
      // Initial route doesn't requires transition
      return MaterialPageRoute(
        builder: (ctx) => const CheckingLoginPage(),
      );
    } else if (route == RouteConstants.login) {
      return _getPageRoute(
        const LoginPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.forgot_password) {
      return _getPageRoute(
        const ForgotPasswordPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.register) {
      return _getPageRoute(
        const RegisterClientPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.enter_reference) {
      return _getPageRoute(
        const EnterReferencePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.verify_phone_number) {
      final String phoneNumber = args?.data[AppConstants.key_phone];
      final bool isRegisterPage = args?.data[AppConstants.key_is_register_page];
      return _getPageRoute(
        LoginVerifyOtpPage(
            phoneNumber: phoneNumber, isFromRegistry: isRegisterPage),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.admin_home) {
      return _getPageRoute(
        const AdminHomePage(),
        transitionType: args?.transitionType,
      );
      // } else if (route == RouteConstants.product_detail) {
      //   return _getPageRoute(
      //     ProductDetailPage(
      //       productId: args?.data,
      //     ),
      //     transitionType: args?.transitionType,
      //   );
      // } else if (route == RouteConstants.cart) {
      //   return _getPageRoute(
      //     CartPage(),
      //     transitionType: args?.transitionType,
      //   );
      // } else if (route == RouteConstants.orders) {
      //   return _getPageRoute(
      //     OrdersPage(),
      //     transitionType: args?.transitionType,
      //   );
      // } else if (route == RouteConstants.user_products) {
      //   return _getPageRoute(
      //     UserProductsPage(),
      //     transitionType: args?.transitionType,
      //   );
      // } else if (route == RouteConstants.manage_product) {
      //   final id = args?.data[AppConstants.key_id];
      //   final option = args?.data[AppConstants.key_option];
      //   return _getPageRoute(
      //     ManageProductPage(
      //       productId: id,
      //       manageOption: option,
      //     ),
      //     transitionType: args?.transitionType,
      //   );
      // }
    }
    return null;
  }

  // ignore: unused_element
  static PageTransition<dynamic> _getPageRoute(
    Widget page, {
    PageTransitionType? transitionType,
    RouteSettings? settings,
  }) {
    // If null, set a default transition
    transitionType ??= PageTransitionType.fade;
    return PageTransition(
      type: transitionType,
      child: page,
      settings: settings,
    );
  }
}
