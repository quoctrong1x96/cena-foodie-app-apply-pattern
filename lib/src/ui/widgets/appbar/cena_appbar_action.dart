part of '../widgets.dart';

class CenaAppBarAction extends StatelessWidget {
  final VoidCallback action;
  final IconData icon;
  final int quantity;

  const CenaAppBarAction(this.action, this.icon, {Key? key, this.quantity = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
          width: 50,
          height: 50,
          // ignore: deprecated_member_use
          child: TextButton(
            onPressed: action,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: CenaColors.WHITE,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Icon(
                  icon,
                  size: 21,
                  color: CenaColors.GREEN,
                ),
              ],
            ),
          )),
    );
  }
}
