import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/getx_services/getx_settings_service.dart';
import '../../widgets/widgets.dart';

class ChangeLanguagesPage extends StatefulWidget {
  const ChangeLanguagesPage({Key? key}) : super(key: key);

  @override
  _ChangeLanguagesPageState createState() => _ChangeLanguagesPageState();
}

class _ChangeLanguagesPageState extends State<ChangeLanguagesPage> {
  final settingService = Get.find<SettingService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CenaAppbarDefault(
        title: "Change languages",
        leading: CenaButtonDefaultBack(),
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // _buildThemeSection(),
            _buildLanguageSection(),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildThemeSection() {
    final theme = Theme.of(context);
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Theme mode",
            style: theme.textTheme.headline6,
          ),
          RadioListTile(
            title: const Text("System"),
            value: ThemeMode.system,
            groupValue: settingService.currentThemeMode.value,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                settingService.changeThemeMode(value);
              }
            },
          ),
          RadioListTile(
            title: const Text("Light"),
            value: ThemeMode.light,
            groupValue: settingService.currentThemeMode.value,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                settingService.changeThemeMode(value);
              }
            },
          ),
          RadioListTile(
            title: const Text("Dark"),
            value: ThemeMode.dark,
            groupValue: settingService.currentThemeMode.value,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                settingService.changeThemeMode(value);
              }
            },
          ),
        ],
      );
    });
  }

  Widget _buildLanguageSection() {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
            title: Row(
              children: const [
                Flag.fromString('us', height: 17, width: 30, fit: BoxFit.fill),
                SizedBox(width: 5.0),
                Text("English"),
              ],
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            value: const Locale.fromSubtags(languageCode: 'en'),
            groupValue: settingService.currentLocate.value,
            onChanged: (Locale? value) {
              if (value != null) {
                settingService.updateLocale(value);
              }
            },
          ),
          RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Row(
              children: const [
                Flag.fromString('vn', height: 17, width: 30, fit: BoxFit.fill),
                SizedBox(width: 5.0),
                Text("Tiếng Việt"),
              ],
            ),
            value: const Locale.fromSubtags(languageCode: 'vi'),
            groupValue: settingService.currentLocate.value,
            onChanged: (Locale? value) {
              if (value != null) {
                settingService.updateLocale(value);
              }
            },
          ),
        ],
      );
    });
  }
}
