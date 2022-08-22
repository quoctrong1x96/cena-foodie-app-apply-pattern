import 'package:cenafoodie/src/utils/constants/app_constants.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/getx_services/getx_settings_service.dart';
import '../../../../resources/generated/l10n.dart';

class LoginLanguageOptions extends StatelessWidget {
  const LoginLanguageOptions({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final settingService = Get.find<SettingService>();
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            borderRadius: BorderRadius.circular(AppConstants.border_radius),
            // icon: const Icon(FontAwesomeIcons.angleDown),
            items: [
              DropdownMenuItem(
                value: const Locale('en'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).login_languages_english),
                    const SizedBox(width: 5.0),
                    const Flag.fromString('us',
                        height: 17, width: 30, fit: BoxFit.fill)
                  ],
                ),
              ),
              DropdownMenuItem(
                value: const Locale('vi'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).login_languages_vietnam),
                    const SizedBox(width: 5.0),
                    const Flag.fromString('vn',
                        height: 17, width: 30, fit: BoxFit.fill)
                  ],
                ),
              ),
            ],
            onChanged: (Locale? value) {
              if (value != null) {
                settingService.updateLocale(value);
              }
            },
            value: settingService.currentLocate.value,
            underline: null,
          ),
        ],
      );
    });
  }
}
