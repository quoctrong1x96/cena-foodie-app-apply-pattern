import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../blocs/user/user_bloc.dart';
import '../../configs/cena_colors.dart';
import '../../generated/l10n.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import 'client_home_page.dart';

class ClientGetCurrentAddressPage extends StatefulWidget {
  const ClientGetCurrentAddressPage({Key? key}) : super(key: key);

  @override
  State<ClientGetCurrentAddressPage> createState() =>
      _ClientGetCurrentAddressPageState();
}

class _ClientGetCurrentAddressPageState
    extends State<ClientGetCurrentAddressPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  DateTime currentBackPressTime = DateTime.now();
  late Animation<double> _scaleAnimation;
  bool _isFinding = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        (() => BlocProvider.of<UserBloc>(context)
            .add(OnInitialCurrentAddressEvent(0, "", ""))));

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

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Nhấn lần nữa để thoát");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocListener<UserBloc, UserState>(
        listener: (context, state) async {
          if (state.address != null || state is FailureUserState) {
            if (mounted) {
              setState(() {
                _isFinding = false;
              });
            }
            await Future.delayed(const Duration(milliseconds: 1000));
            Navigator.pushAndRemoveUntil(context,
                routeCena(page: const ClientHomePage()), (route) => false);
          } else {}
        },
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: _isFinding
                ? Container(
                    color: CenaColors.WHITE,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 250.0,
                        ),
                        CenaTextDescription(
                            text: lang.client_home_looking_for_address),
                        Expanded(
                          child: Center(
                              child: Align(
                            alignment: Alignment.center,
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) => Transform.scale(
                                scale: _scaleAnimation.value,
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:
                                      Image.asset('Assets/Logo/logo-white.png'),
                                ),
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CenaTextDescription(
                        text: userBloc.state.address!.addressDetail,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        maxLine: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
        ));
  }
}
