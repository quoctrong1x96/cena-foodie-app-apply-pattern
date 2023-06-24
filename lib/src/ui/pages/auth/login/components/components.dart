import 'dart:convert';

import 'package:flag/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

import '../../../../../data/models/ui/page_arguments.dart';
import '../../../../../utils/constants/app_constants.dart';
import '../../../../../utils/constants/route_constants.dart';
import '../../../../../utils/getx_services/getx_settings_service.dart';
import '../../../../../utils/log_utils.dart';
import '../../../../../utils/navigation_utils.dart';
import '../../../../../utils/themes/theme_manager.dart';
import '../../../../../utils/themes/theme_maps.dart';
import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/general/general_bloc.dart';
import '../../../../resources/generated/l10n.dart';
import '../../../../widgets/animation_route.dart';
import '../../../../widgets/widgets.dart';
import '../../otp/login_verify_phone_page.dart';

part './login_change_theme.dart';
part './login_app_name.dart';
part './login_languages_options.dart';
part './login_social.dart';
part './login_logo.dart';
part './login_email.dart';
part './login_phone.dart';
