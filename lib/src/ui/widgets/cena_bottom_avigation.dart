import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/configs/cena_colors.dart';
import '../blocs/user/user_bloc.dart';
import '../pages/client/home/client_home_page.dart';
import 'animation_route.dart';
import 'widgets.dart';

class BottomNavigationCena extends StatelessWidget {
  final int index;

  const BottomNavigationCena(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: -5)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ItemButton(
              i: 0,
              index: index,
              iconData: Icons.home_outlined,
              text: 'Home',
              onPressed: () {
                final userBloc = BlocProvider.of<UserBloc>(context);
                if (userBloc.state.address == null) {
                  userBloc.add(OnInitialCurrentAddressEvent(
                      userBloc.state.user!.id,
                      userBloc.state.user!.firstName +
                          " " +
                          userBloc.state.user!.lastName,
                      userBloc.state.user!.phone));
                }
                Navigator.pushReplacement(
                    context, routeCena(page: const ClientHomePage()));
              },
            ),
            _ItemButton(
              i: 1,
              index: index,
              iconData: Icons.search,
              text: 'Search',
              onPressed: () => {}, //TODO here*/
              // Navigator.pushReplacement(
              //     context, routeCena(page: const SearchClientPage())),
            ),
            // _ItemButton(
            //   i: 2,
            //   index: index,
            //   iconData: Icons.local_mall_outlined,
            //   text: 'Cart',
            //   onPressed: () => Navigator.pushReplacement(
            //       context, routeCena(page: const CartClientPage())),
            // ),
            _ItemButton(
              i: 2,
              index: index,
              iconData: Icons.person_outline_outlined,
              text: 'Profile',
              onPressed: () => {}, //TODO here/
              // Navigator.pushReplacement(
              //     context, routeCena(page: const ProfileClientPage())),
            ),
          ],
        ));
  }
}

class _ItemButton extends StatelessWidget {
  final int i;
  final int index;
  final IconData iconData;
  final String text;
  final VoidCallback? onPressed;

  const _ItemButton(
      {required this.i,
      required this.index,
      required this.iconData,
      required this.text,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
        decoration: BoxDecoration(
            color: (i == index)
                ? CenaColors.primary.withOpacity(.9)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15.0)),
        child: (i == index)
            ? Row(
                children: [
                  Icon(iconData, color: Colors.white, size: 25),
                  const SizedBox(width: 6.0),
                  CenaTextDescription(
                      text: text,
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)
                ],
              )
            : Icon(iconData, size: 28),
      ),
    );
  }
}
