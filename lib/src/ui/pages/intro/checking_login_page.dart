import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/blocs/auth/auth_bloc.dart';
import '../../blocs/store/store_bloc.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../blocs/user/user_bloc.dart';
import '../../widgets/animation_route.dart';
import '../Admin/admin_home_page.dart';
import '../auth/enter_references_page.dart';
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
          Navigator.pushAndRemoveUntil(context,
              routeCena(page: const CheckingLoginPage()), (route) => false);
        } else if (state is LogOutAuthState) {
          Navigator.pushAndRemoveUntil(
              context, routeCena(page: const LoginPage()), (route) => false);
        } else if (state is FailureAuthState) {
          Navigator.pushAndRemoveUntil(
              context, routeCena(page: const LoginPage()), (route) => false);
        } else if (state.rolId != '') {
          userBloc.add(OnGetUserEvent(state.user!));
          storeBloc.add(OnGetStoreEvent(state.store!));

          if (state.rolId == '1') {
            Navigator.pushAndRemoveUntil(context,
                routeCena(page: const AdminHomePage()), (route) => false);
          } else if (state.rolId == '3') {
            // Navigator.pushAndRemoveUntil(context,
            //     routeCena(page: const DeliveryHomePage()), (route) => false);
          } else if (state.rolId == '2') {
            Navigator.pushAndRemoveUntil(context,
                routeCena(page: const EnterReferencePage()), (route) => false);
          }
        } else {
          Navigator.pushAndRemoveUntil(
              context, routeCena(page: const LoginPage()), (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
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
            )
          ],
        ),
      ),
    );
  }
}
