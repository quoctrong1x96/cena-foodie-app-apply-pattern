import 'package:cenafoodie/src/ui/pages/admin/category/categories_admin_page.dart';
import 'package:cenafoodie/src/ui/pages/admin/delivery/list_delivery_page.dart';
import 'package:cenafoodie/src/ui/pages/admin/products/list_products_page.dart';
import 'package:cenafoodie/src/ui/pages/admin/store/store_edit_page.dart';
import 'package:cenafoodie/src/ui/pages/client/client_profile/profile_client_page.dart';
import 'package:cenafoodie/src/ui/pages/client/orders/client_orders_page.dart';
import 'package:cenafoodie/src/ui/pages/home/select_role_page.dart';
import 'package:cenafoodie/src/ui/pages/profile/change_languages_page.dart';
import 'package:cenafoodie/src/ui/pages/profile/change_password_page.dart';
import 'package:cenafoodie/src/ui/pages/profile/edit-profile/profile_edit_last_name.dart';
import 'package:cenafoodie/src/ui/pages/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../data/models/entities/order/order.dart';
import '../data/models/entities/product/product.dart';
import '../data/models/entities/store/store.dart';
import '../data/models/ui/page_arguments.dart';
import '../ui/pages/admin/admin_home_page.dart';
import '../ui/pages/admin/dashboard/admin_dashboard_page.dart';
import '../ui/pages/auth/forgot_password_page.dart';
import '../ui/pages/auth/login/login_page.dart';
import '../ui/pages/auth/otp/login_verify_phone_page.dart';
import '../ui/pages/auth/reference/enter_references_page.dart';
import '../ui/pages/auth/register/register_client_page.dart';
import '../ui/pages/client/cart/cart_client_page.dart';
import '../ui/pages/client/client_get_current_address_page.dart';
import '../ui/pages/client/home/client_home_page.dart';
import '../ui/pages/client/detail_product/details_product_page.dart';
import '../ui/pages/client/orders/client_details_order_page.dart';
import '../ui/pages/client/orders/client_map_page.dart';
import '../ui/pages/client/searchs/search_for_category_page.dart';
import '../ui/pages/client/store_order/store_order.dart';
import '../ui/pages/delivery/delivery_home_page.dart';
import '../ui/pages/delivery/list_orders_delivery_page.dart';
import '../ui/pages/delivery/order_delivered_page.dart';
import '../ui/pages/delivery/order_on_way_page.dart';
import '../ui/pages/intro/checking_login_page.dart';
import '../ui/pages/map/add_street_address_page.dart';
import '../ui/pages/profile/edit-profile/profile_edit_first_name.dart';
import '../ui/pages/client/address/list_addresses_page.dart';
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
    } else if (route == RouteConstants.get_current_address_of_user) {
      return _getPageRoute(
        const ClientGetCurrentAddressPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_home) {
      return _getPageRoute(
        const ClientHomePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_address) {
      return _getPageRoute(
        const ListAddressesPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_add_address) {
      return _getPageRoute(
        const AddStreetAddressPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.product_detail) {
      final Product product = args?.data['product'];
      final int storeId = args?.data['store_id'];
      return _getPageRoute(
        DetailsProductPage(
          product: product,
          storeId: storeId,
        ),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.cart_client) {
      final List<Store> stores = args?.data['stores'];
      return _getPageRoute(
        CartClientPage(
          listStore: stores,
        ),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.store_order) {
      final Store stores = args?.data['stores'];
      return _getPageRoute(
        StoreOrderPage(stores),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.search_by_category) {
      final String categoryName = args?.data['category_name'];
      final int categoryId = args?.data['category_id'];
      return _getPageRoute(
        SearchForCategoryPage(idCategory: categoryId, category: categoryName),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_profile) {
      return _getPageRoute(
        const ProfileClientPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_profile_edit) {
      return _getPageRoute(
        const EditProfilePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_profile_lastname) {
      return _getPageRoute(
        const EditLastNameProfilePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_profile_firstname) {
      return _getPageRoute(
        const EditFirstNameProfilePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.order_on_way) {
      return _getPageRoute(
        OrderOnWayPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.order_deliveried) {
      return _getPageRoute(
        const OrderDeliveredPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.order_details) {
      return _getPageRoute(
        ListOrdersDeliveryPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.setting_change_languages) {
      return _getPageRoute(
        const ChangeLanguagesPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.delivery_home) {
      return _getPageRoute(
        const DeliveryHomePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.select_role) {
      return _getPageRoute(
        const SelectRolePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_order_detail) {
      final Order order = args?.data['order'];
      return _getPageRoute(
        ClientDetailsOrderPage(orderClient: order),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.client_order) {
      return _getPageRoute(
        ClientOrdersPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.change_password) {
      return _getPageRoute(
        const ChangePasswordPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.admin_category) {
      final int storeId = args?.data['storeId'];
      return _getPageRoute(
        CategoriesAdminPage(storeId),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.admin_edit) {
      return _getPageRoute(
        const EditStorePage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.admin_list_product) {
      return _getPageRoute(
        const ListProductsPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.admin_list_deliveries) {
      return _getPageRoute(
        const ListDeliveriesPage(),
        transitionType: args?.transitionType,
      );
    } else if (route == RouteConstants.admin_dashboard) {
      final int storeId = args?.data['storeId'];
      return _getPageRoute(
        AdminDashboardPage(storeId),
        transitionType: args?.transitionType,
      );
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
