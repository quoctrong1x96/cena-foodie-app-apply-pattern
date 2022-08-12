part of '../widgets.dart';

class CenaButtonOrganic extends StatelessWidget {
  final VoidCallback action;
  final String label;
  final IconData icon;
  const CenaButtonOrganic(this.action, this.label, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: action,
      color: CenaColors.buttonBGWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: CenaColors.backgroundDarker,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: CenaColors.primary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              icon,
              color: CenaColors.GREEN,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
