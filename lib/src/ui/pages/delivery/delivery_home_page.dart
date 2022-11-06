import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ui/blocs/auth/auth_bloc.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../../utils/constants/route_constants.dart';
import '../../../utils/helpers/helpers.dart';
import '../../../utils/navigation_utils.dart';
import '../../resources/generated/l10n.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../widgets/widgets.dart';
import '../app/app_privacy_policy.dart';
import '../app/app_terms_conditions.dart';
import '../home/select_role_page.dart';
import '../intro/checking_login_page.dart';

class DeliveryHomePage extends StatelessWidget {
  const DeliveryHomePage({Key? key}) : super(key: key);

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
    final lang = S.of(context);
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoadingAuthState) {
            modalLoading(context);
          } else if (state is SuccessAuthState) {
            Navigator.pop(context);
            cenaToastSuccess("Picture Change Successfully");
            NavigationUtils.replace(context, RouteConstants.delivery_home);
            Navigator.pop(context);
          } else if (state is FailureAuthState) {
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
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                children: [
                  const SizedBox(height: 20.0),
                  Align(
                      alignment: Alignment.center,
                      child: CenaImageCirclePicker(false, 50, null)),
                  const SizedBox(height: 20.0),
                  Center(
                      child: CenaTextDescription(
                          text: authBloc.state.user!.firstName +
                              ' ' +
                              authBloc.state.user!.lastName,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5.0),
                  Center(
                      child: CenaTextDescription(
                          text: authBloc.state.user!.email,
                          fontSize: 20,
                          color: Colors.grey)),
                  CenaTextGroup(
                      text: lang.admin_group_account, color: Colors.grey),
                  CenaButtonLineIcon(
                    text: lang.admin_profile_settings,
                    icon: Icons.person,
                    colorIcon: const Color(0xff01C58C),
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.client_profile_edit),
                  ),
                  CenaButtonLineIcon(
                    text: lang.admin_change_password,
                    icon: Icons.lock_rounded,
                    colorIcon: const Color(0xff1B83F5),
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.change_password),
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
                  CenaTextGroup(
                      text: lang.delivery_home_group_delivery,
                      color: Colors.grey),
                  CenaButtonLineIcon(
                    text: lang.delivery_home_name_assigned,
                    icon: Icons.checklist_rounded,
                    colorIcon: const Color(0xff5E65CD),
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.order_details),
                  ),
                  CenaButtonLineIcon(
                    text: lang.delivery_home_name_on_way,
                    icon: Icons.delivery_dining_rounded,
                    colorIcon: const Color(0xff1A60C1),
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.order_on_way),
                  ),
                  CenaButtonLineIcon(
                    text: lang.delivery_home_name_delivered,
                    icon: Icons.check_rounded,
                    colorIcon: const Color(0xff4BB17B),
                    onPressed: () => NavigationUtils.push(
                        context, RouteConstants.order_deliveried),
                  ),
                  CenaTextGroup(
                      text: S.of(context).settings_system, color: Colors.grey),
                  CenaButtonLineIcon(
                      text: S.of(context).settings_system_languages,
                      icon: FontAwesomeIcons.language,
                      colorIcon: const Color.fromARGB(255, 10, 126, 204),
                      onPressed: () => NavigationUtils.push(
                          context, RouteConstants.setting_change_languages)),
                  CenaTextGroup(
                    text: lang.admin_group_system_settings,
                    color: Colors.grey,
                  ),
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
