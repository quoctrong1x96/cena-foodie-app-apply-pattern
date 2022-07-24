import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../configs/cena_colors.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import '../Admin/admin_home_page.dart';
import '../client/client_home_page.dart';
import '../delivery/delivery_home_page.dart';

class SelectRolePage extends StatelessWidget {
  const SelectRolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context).state;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CenaTextDescription(
                      text: 'Cena ',
                      fontSize: 25,
                      color: CenaColors.primary,
                      fontWeight: FontWeight.w500),
                  CenaTextDescription(
                      text: 'Foodie',
                      fontSize: 25,
                      color: CenaColors.secondary,
                      fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 20.0),
              const CenaTextDescription(
                text: 'How do you want to continue?',
                color: CenaColors.secondary,
                fontSize: 25,
              ),
              const SizedBox(height: 30.0),
              (authBloc.user!.rolId == 1)
                  ? _BtnRol(
                      svg: 'Assets/svg/restaurante.svg',
                      text: 'Restaurant',
                      color1: CenaColors.primary.withOpacity(.2),
                      color2: Colors.greenAccent.withOpacity(.1),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          routeCena(page: const AdminHomePage()),
                          (route) => false),
                    )
                  : Container(),
              (authBloc.user!.rolId == 1 || authBloc.user!.rolId == 3)
                  ? _BtnRol(
                      svg: 'Assets/svg/bussiness-man.svg',
                      text: 'Client',
                      color1: const Color(0xffFE6488).withOpacity(.2),
                      color2: Colors.amber.withOpacity(.1),
                      onPressed: () {
                        final userBloc = BlocProvider.of<UserBloc>(context);
                        if (userBloc.state.address == null) {
                          userBloc.add(OnInitialCurrentAddressEvent(
                              userBloc.state.user!.uid!,
                              authBloc.user!.firstName! +
                                  " " +
                                  authBloc.user!.lastName!,
                              authBloc.user!.phone!));
                        }
                        Navigator.pushReplacement(
                            context, routeCena(page: const ClientHomePage()));
                      },
                    )
                  : Container(),
              (authBloc.user!.rolId == 1 || authBloc.user!.rolId == 3)
                  ? _BtnRol(
                      svg: 'Assets/svg/delivery-bike.svg',
                      text: 'Delivery',
                      color1: const Color(0xff8956FF).withOpacity(.2),
                      color2: Colors.purpleAccent.withOpacity(.1),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          routeCena(page: const DeliveryHomePage()),
                          (route) => false),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class _BtnRol extends StatelessWidget {
  final String svg;
  final String text;
  final Color color1;
  final Color color2;
  final VoidCallback? onPressed;

  const _BtnRol(
      {required this.svg,
      required this.text,
      required this.color1,
      required this.color2,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onPressed,
        child: Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft, colors: [color1, color2]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  svg,
                  height: 100,
                ),
                CenaTextDescription(
                    text: text, fontSize: 20, color: CenaColors.secondary)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
