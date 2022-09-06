// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/blocs/auth/auth_bloc.dart';
import '../../../utils/constants/route_constants.dart';
import '../../../utils/navigation_utils.dart';
import '../../blocs/store/store_bloc.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../blocs/user/user_bloc.dart';
import '../../widgets/animation_route.dart';
import '../Admin/admin_home_page.dart';
import '../auth/reference/enter_references_page.dart';
import '../auth/login/login_page.dart';

class CheckingLoginPage extends StatefulWidget {
  const CheckingLoginPage({Key? key}) : super(key: key);

  @override
  _CheckingLoginPageState createState() => _CheckingLoginPageState();
}

class _CheckingLoginPageState extends State<CheckingLoginPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final storeBloc = BlocProvider.of<StoreBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingAuthState) {
          _continueCheckLogin(context);
        } else if (state is LogOutAuthState) {
          _logout(context);
        } else if (state is FailureAuthState) {
          _goToLogin(context);
        } else if (state.rolId != '') {
          userBloc.add(OnGetUserEvent(state.user!));
          if (state.store != null) {
            storeBloc.add(OnGetStoreEvent(state.store!));
          }

          if (state.rolId == '1') {
            _goToAdminPage(context);
          } else if (state.rolId == '3') {
            // Navigator.pushAndRemoveUntil(context,
            //     routeCena(page: const DeliveryHomePage()), (route) => false);
          } else if (state.rolId == '2') {
            _goToClientPage(context);
          }
        } else {
          _goToLogin(context);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildLogoAnimation(context)],
        ),
      ),
    );
  }

  void _goToClientPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context, routeCena(page: const EnterReferencePage()), (route) => false);
  }

  void _goToAdminPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context, routeCena(page: const AdminHomePage()), (route) => false);
  }

  void _goToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      NavigationUtils.replace(
        context,
        RouteConstants.login,
      );
    });
    // Navigator.pushAndRemoveUntil(
    //     context, routeCena(page: const LoginPage()), (route) => false);
  }

  void _logout(BuildContext context) {
    NavigationUtils.replace(
      context,
      RouteConstants.login,
    );
    // Navigator.pushAndRemoveUntil(
    //     context, routeCena(page: const LoginPage()), (route) => false);
  }

  Widget _buildLogoAnimation(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('Assets/Logo/logo-white.png'),
          ),
        ),
      ),
    );
  }

  void _continueCheckLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context, routeCena(page: const CheckingLoginPage()), (route) => false);
  }
}
