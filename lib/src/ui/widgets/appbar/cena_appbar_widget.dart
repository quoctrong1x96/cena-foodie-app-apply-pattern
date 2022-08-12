part of '../widgets.dart';

class CenaAppBarWidget extends AppBar {
  CenaAppBarWidget({
    Key? key,
    VoidCallback? onBackPressed,
    String title = "",
    List<Widget> rightActions = const [],
  }) : super(
          key: key,
          title: Text(title),
          toolbarHeight: 50,
          leading: IconButton(
              onPressed: onBackPressed,
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          actions: rightActions,
        );
}
