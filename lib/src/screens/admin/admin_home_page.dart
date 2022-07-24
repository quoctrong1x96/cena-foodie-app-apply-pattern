import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/store/store_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../configs/cena_colors.dart';
import '../../generated/l10n.dart';
import '../../helpers/helpers.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import '../Admin/Category/categories_admin_page.dart';
import '../Admin/Products/list_products_page.dart';
import '../Admin/delivery/list_delivery_page.dart';
import '../Admin/store/store_edit_page.dart';
import '../app/app_privacy_policy.dart';
import '../app/app_terms_conditions.dart';
import '../home/select_role_page.dart';
import '../intro/checking_login_page.dart';
import '../profile/change_languages_page.dart';
import '../profile/change_password_page.dart';
import '../profile/edit_profile_page.dart';
import 'dashboard/admin_dashboard_page.dart';
import 'marketing/admin_marketing_page.dart';
import 'orders_admin/orders_admin_page.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await _showExitBottomSheet(context);
    return exitResult ?? false;
  }

  Future<bool?> _showExitBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: _buildBottomSheet(context),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        CenaTextDescription(
          text: S.of(context).admin_confirm_exit,
          fontSize: 16,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: CenaTextDescription(
                text: S.of(context).admin_confirm_no,
                fontSize: 16,
                color: CenaColors.primary,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: CenaTextDescription(
                text: S.of(context).admin_confirm_yes,
                fontSize: 16,
                color: CenaColors.GREY,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final storeBloc = BlocProvider.of<StoreBloc>(context);
    final lang = S.of(context);

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is LoadingUserState) {
            modalLoading(context);
          } else if (state is SuccessUserState) {
            Navigator.pop(context);
            // cenaToastSuccess("Thay đổi ảnh đại diện thành công");
            Navigator.pushReplacement(
                context, routeCena(page: const AdminHomePage()));
            Navigator.pop(context);
          } else if (state is FailureUserState) {
            Navigator.pop(context);
            errorMessageSnack(context, state.error);
          }
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CenaColors.LIGHT_GREY,
            child: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: CenaImageCirclePicker(false, 50, null)),
                  const SizedBox(height: 10.0),
                  Center(
                      child: BlocBuilder<UserBloc, UserState>(
                          builder: (_, state) => CenaTextDescription(
                                text: (state.user != null)
                                    ? state.user!.firstName!.toUpperCase() +
                                        ' ' +
                                        state.user!.lastName!.toUpperCase()
                                    : '',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                maxLine: 1,
                                textAlign: TextAlign.center,
                              ))),
                  const SizedBox(height: 5.0),
                  Center(
                      child: BlocBuilder<UserBloc, UserState>(
                          builder: (_, state) => CenaTextDescription(
                                text: (state.user != null)
                                    ? state.user!.email!
                                    : '',
                                fontSize: 20,
                              ))),
                  CenaTextGroup(text: lang.admin_group_account),
                  CenaButtonLineIcon(
                    text: lang.admin_profile_settings,
                    icon: Icons.person,
                    colorIcon: const Color(0xff01C58C),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const EditProfilePage())),
                  ),
                  CenaButtonLineIcon(
                    text: lang.admin_change_password,
                    icon: Icons.lock_rounded,
                    colorIcon: const Color(0xff1B83F5),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const ChangePasswordPage())),
                  ),
                  if (authBloc.state.rolId == '1')
                    CenaButtonLineIcon(
                      text: lang.admin_change_role,
                      icon: Icons.swap_horiz_rounded,
                      colorIcon: const Color(0xffE62755),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          routeCena(page: const SelectRolePage()),
                          (route) => false),
                    ),
                  CenaTextGroup(text: lang.admin_group_store_managerment),
                  CenaButtonLineIcon(
                    text: lang.admin_store,
                    icon: Icons.store,
                    colorIcon: const Color(0xffE62755),
                    onPressed: () => Navigator.push(
                        context,
                        routeCena(
                            page: const EditStorePage(),
                            curved: Curves.decelerate)),
                  ),
                  CenaButtonLineIcon(
                    text: lang.admin_categoris,
                    icon: Icons.category_rounded,
                    colorIcon: const Color(0xff5E65CD),
                    onPressed: () => Navigator.push(
                        context,
                        routeCena(
                            page: CategoriesAdminPage(
                                storeBloc.state.store!.id!))),
                  ),
                  CenaButtonLineIcon(
                    text: lang.admin_foods_and_drinks,
                    icon: Icons.add,
                    colorIcon: const Color(0xff355773),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const ListProductsPage())),
                  ),
                  CenaButtonLineIcon(
                    text: lang.admin_delivery,
                    icon: Icons.delivery_dining_rounded,
                    colorIcon: const Color(0xff469CD7),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const ListDeliveriesPage())),
                  ),
                  CenaButtonLineIcon(
                    text: lang.admin_orders,
                    icon: Icons.checklist_rounded,
                    colorIcon: const Color(0xffFFA136),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const OrdersAdminPage())),
                  ),
                  CenaButtonLineIcon(
                    text: "Kênh marketing",
                    icon: FontAwesomeIcons.bullhorn,
                    colorIcon: const Color.fromARGB(255, 54, 232, 255),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const AdminMarketingPage())),
                  ),
                  CenaTextGroup(text: lang.admin_group_dashboard),
                  CenaButtonLineIcon(
                    text: lang.admin_dashboard,
                    icon: FontAwesomeIcons.chartSimple,
                    colorIcon: const Color(0xff469CD7),
                    onPressed: () => Navigator.push(
                        context,
                        routeCena(
                            page: AdminDashboardPage(
                                storeBloc.state.store!.id!))),
                  ),
                  CenaTextGroup(text: S.of(context).settings_system),
                  CenaButtonLineIcon(
                      text: S.of(context).settings_system_languages,
                      icon: FontAwesomeIcons.language,
                      colorIcon: const Color.fromARGB(255, 10, 126, 204),
                      onPressed: () => Navigator.push(context,
                          routeCena(page: const ChangeLanguagesPage()))),
                  CenaTextGroup(text: lang.admin_group_system_settings),
                  CenaButtonLineIcon(
                    text: lang.admin_dark_mode,
                    icon: Icons.dark_mode_rounded,
                    colorIcon: const Color(0xff051E2F),
                    isDisable: true,
                  ),
                  CenaButtonLineIcon(
                      text: lang.admin_privacy_policy,
                      icon: Icons.policy_rounded,
                      colorIcon: const Color(0xff6Dbd63),
                      onPressed: () => Navigator.push(
                          context, routeCena(page: const CenaPrivacy()))),
                  CenaButtonLineIcon(
                    text: lang.admin_security,
                    icon: Icons.lock_outline_rounded,
                    colorIcon: const Color(0xff1F252C),
                    isDisable: true,
                  ),
                  CenaButtonLineIcon(
                      text: lang.admin_term_conditions,
                      icon: Icons.description_outlined,
                      colorIcon: const Color(0xff458bff),
                      onPressed: () => Navigator.push(
                          context, routeCena(page: const CenaTerms()))),
                  CenaButtonLineIcon(
                    text: lang.admin_help,
                    icon: Icons.help_outline,
                    colorIcon: const Color(0xff4772e6),
                    isDisable: true,
                  ),
                  const SizedBox(height: 20.0),
                  CenaButtonLineIcon(
                    text: lang.admin_logout,
                    icon: Icons.power_settings_new_sharp,
                    colorIcon: const Color(0xffF02849),
                    onPressed: () {
                      authBloc.add(LogOutEvent());
                      Navigator.pushAndRemoveUntil(
                          context,
                          routeCena(page: const CheckingLoginPage()),
                          (route) => false);
                    },
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
