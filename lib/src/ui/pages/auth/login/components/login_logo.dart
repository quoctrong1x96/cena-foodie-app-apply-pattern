part of './components.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // LoginLanguageOptions(context: context),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  AppName(),
                  // LoginChangeThemeButton(
                  //     key: changeThemeKey,
                  //     myThemeKey: MyThemes.instance.currentThemeKey,
                  //     parrentWidget: loginWidget),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('Assets/Logo/logo-black.png', height: 140),
        ],
      ),
    );
  }
}
