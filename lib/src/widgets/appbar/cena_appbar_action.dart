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
        child: FlatButton(
          onPressed: action,
          padding: EdgeInsets.zero,
          color: CenaColors.WHITE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Icon(
                icon,
                size: 21,
                color: CenaColors.GREEN,
              ),
              // Visibility(
              //   // ignore: unnecessary_null_comparison
              //   // visible: quantity != null,
              //   child: Positioned(
              //     top: -5,
              //     right: -10,
              //     child: Container(
              //       width: 15,
              //       height: 15,
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           color: AppColors.DARK,
              //           borderRadius: BorderRadius.circular(15)),
              //       child: Text(
              //         quantity.toString(),
              //         style: TextStyle(
              //           fontSize: 11,
              //           color: AppColors.WHITE,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
