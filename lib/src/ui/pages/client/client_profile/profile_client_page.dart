import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/route_constants.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/cena_bottom_avigation.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../../app/app_privacy_policy.dart';
import '../../app/app_terms_conditions.dart';
import '../../profile/change_password_page.dart';
import '../../profile/edit_profile_page.dart';

class ProfileClientPage extends StatelessWidget {
  const ProfileClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final lang = S.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          modalLoading(context);
        } else if (state is SuccessAuthState) {
          Navigator.pop(context);
          cenaToastSuccess("Picture Change Successfully");
          Navigator.pushReplacement(
              context, routeCena(page: const ProfileClientPage()));
          Navigator.pop(context);
        } else if (state is FailureAuthState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CenaTextDescription(text: state.error, color: Colors.white),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.primary,
        body: SafeArea(
          child: Container(
            color: CenaColors.LIGHT_GREY,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              children: [
                Container(
                  color: CenaColors.primary,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppConstants.padding_left,
                            right: AppConstants.padding_right,
                            bottom: AppConstants.padding_left),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: CenaImageCirclePicker(false, 60, null)),
                      ),
                      Center(
                          child: CenaTextDescription(
                              text: authBloc.state.user!.firstName +
                                  ' ' +
                                  authBloc.state.user!.lastName,
                              fontSize: 20,
                              color: CenaColors.WHITE,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                CenaTextGroup(
                  text: S.of(context).settings_account,
                  color: Colors.grey,
                  fontSize: 15,
                ),
                CenaButtonLineIcon(
                  text: S.of(context).settings_account_profile,
                  icon: Icons.person,
                  fontSize: 15,
                  colorIcon: const Color(0xff01C58C),
                  onPressed: () => Navigator.push(
                      context, routeCena(page: const EditProfilePage())),
                ),
                CenaButtonLineIcon(
                  text: S.of(context).settings_account_password,
                  icon: Icons.lock_rounded,
                  fontSize: 15,
                  colorIcon: const Color(0xff1B83F5),
                  onPressed: () => Navigator.push(
                      context, routeCena(page: const ChangePasswordPage())),
                ),
                if (authBloc.state.rolId == '1')
                  CenaButtonLineIcon(
                    text: S.of(context).settings_store_orders,
                    icon: Icons.swap_horiz_rounded,
                    fontSize: 15,
                    colorIcon: const Color(0xffE62755),
                    onPressed: () => NavigationUtils.clearStack(context,
                        newRouteName: RouteConstants.select_role),
                  ),
                CenaTextGroup(
                    text: S.of(context).settings_client,
                    fontSize: 15,
                    color: Colors.grey),
                CenaButtonLineIcon(
                  text: S.of(context).settings_client_address,
                  icon: Icons.my_location_rounded,
                  fontSize: 15,
                  colorIcon: const Color(0xffFB5019),
                  onPressed: () => NavigationUtils.push(
                      context, RouteConstants.client_address),
                ),
                CenaButtonLineIcon(
                  text: S.of(context).settings_client_orders,
                  icon: Icons.shopping_bag_outlined,
                  fontSize: 15,
                  colorIcon: const Color(0xffFBAD49),
                  onPressed: () => NavigationUtils.push(
                      context, RouteConstants.client_order),
                ),
                CenaTextGroup(
                    text: S.of(context).settings_system,
                    fontSize: 15,
                    color: Colors.grey),
                CenaButtonLineIcon(
                    text: S.of(context).settings_system_languages,
                    fontSize: 15,
                    icon: FontAwesomeIcons.language,
                    colorIcon: const Color.fromARGB(255, 10, 126, 204),
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.setting_change_languages)),
                CenaButtonLineIcon(
                  text: S.of(context).settings_system_dark_mode,
                  icon: Icons.dark_mode_rounded,
                  fontSize: 15,
                  colorIcon: const Color(0xff051E2F),
                  isDisable: true,
                ),
                CenaButtonLineIcon(
                    text: lang.admin_privacy_policy,
                    icon: Icons.policy_rounded,
                    fontSize: 15,
                    colorIcon: const Color(0xff6Dbd63),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const CenaPrivacy()))),
                CenaButtonLineIcon(
                  text: lang.admin_security,
                  icon: Icons.lock_outline_rounded,
                  fontSize: 15,
                  colorIcon: const Color(0xff1F252C),
                  isDisable: true,
                ),
                CenaButtonLineIcon(
                    text: lang.admin_term_conditions,
                    icon: Icons.description_outlined,
                    fontSize: 15,
                    colorIcon: const Color(0xff458bff),
                    onPressed: () => Navigator.push(
                        context, routeCena(page: const CenaTerms()))),
                CenaButtonLineIcon(
                  text: lang.admin_help,
                  icon: Icons.help_outline,
                  fontSize: 15,
                  colorIcon: const Color(0xff4772e6),
                  isDisable: true,
                ),
                const SizedBox(height: 20.0),
                CenaButtonLineIcon(
                  text: lang.admin_logout,
                  fontSize: 15,
                  icon: Icons.power_settings_new_sharp,
                  colorIcon: const Color(0xffF02849),
                  onPressed: () {
                    authBloc.add(LogOutEvent());
                    NavigationUtils.clearStack(context,
                        newRouteName: RouteConstants.check_login);
                  },
                ),
                const SizedBox(height: 4.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationCena(2),
      ),
    );
  }
}
