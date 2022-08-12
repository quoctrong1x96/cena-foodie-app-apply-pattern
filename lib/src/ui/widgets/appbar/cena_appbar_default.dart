part of '../widgets.dart';

class CenaAppbarDefault extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double preferredSizeInput;
  const CenaAppbarDefault(
      {Key? key,
      this.title = AppConstants.appName,
      this.leading,
      this.actions,
      this.centerTitle = true,
      this.bottom,
      this.color,
      this.preferredSizeInput = 38})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(preferredSizeInput);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(color: color ?? CenaColors.WHITE, fontSize: 16)),
      centerTitle: centerTitle,
      backgroundColor: CenaColors.background,
      elevation: 10,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                CenaColors.secondary,
                CenaColors.primary,
              ],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: color ?? CenaColors.secondary),
      leading: leading,
      actions: actions,
      bottom: bottom,
    );
  }
}
