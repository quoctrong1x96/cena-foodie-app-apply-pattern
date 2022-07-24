part of '../widgets.dart';

class CenaAppBarCustom extends PreferredSize {
  final String title;
  final double height;
  final List<Widget> leadings;
  final List<Widget> actions;

  CenaAppBarCustom(
    this.title, {
    Key? key,
    this.leadings = const [],
    this.actions = const [],
    this.height = 120,
  }) : super(key: key, child: Container(), preferredSize: const Size(20, 120));

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 25,
                    top: 5,
                    bottom: 5,
                    child: Row(
                      children: leadings,
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: CenaColors.DARK,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 5,
                    bottom: 5,
                    child: Row(
                      children: actions,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
