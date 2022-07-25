import 'package:cached_network_image/cached_network_image.dart';
import '../blocs/user/user_bloc.dart';
import '../helpers/helpers.dart';
import '../models/response/orders_by_status_response.dart';
import '../screens/map/add_street_address_page.dart';
import '../services/url.dart';
import 'animation_route.dart';
import 'pickers/app_label_date_picker.dart';
import '../commons/app_dimens.dart';
import '../configs/cena_images.dart';
import '../configs/cena_colors.dart';
import '../configs/cena_margins.dart';
import '../configs/cena_paddings.dart';
import '../configs/cena_settings.dart';
import '../configs/cena_text_styles.dart';
import '../utils/checking_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Animations/animations.dart';
import '../blocs/my_location/my_location_map_bloc.dart';
import '../helpers/date.dart';
import 'package:image_picker/image_picker.dart';
import 'package:group_button/group_button.dart';
import 'package:shimmer/shimmer.dart';
import '../generated/l10n.dart';
import 'app_circular_progress_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../controllers/store_controller.dart';

part "manual_market_map.dart";
part "cena_text_description.dart";
part 'cena_button.dart';
part 'cena_form_field.dart';
part 'cena_shimmer.dart';

part 'card_orders_delivery.dart';

part 'staggered_dual_view.dart';

//apbar widget
part 'appbar/cena_appbar_widget.dart';
part 'appbar/cena_appbar_action.dart';
part 'appbar/cena_appbar_default.dart';
part 'appbar/cena_appbar_custom.dart';

//button widget
part 'buttons/cena_button_widget.dart';
part 'buttons/cena_button_white.dart';
part 'buttons/cena_button_line_icon.dart';
part 'buttons/cena_button_default_back.dart';
part 'buttons/cena_button_tint.dart';
part 'buttons/cena_button_icon.dart';
part 'buttons/cena_button_organic.dart';
part 'buttons/cena_button_rating_star.dart';

//group check widget
part 'group/cena_group_button.dart';
part 'group/cena_group_multicheck.dart';

//image widget
part 'images/cena_image_cirle_avatar.dart';
part 'images/cena_image_cache.dart';
part 'images/cena_image_cirle_picker.dart';
part 'images/cena_image_product.dart';
part 'images/cena_image_review.dart';
part 'images/cena_image_slide.dart';
part 'images/cena_image_square.dart';

//Input widgets
part 'inputs/cena_input_password.dart';
part 'inputs/cena_input_email.dart';
part 'inputs/cena_input_phone.dart';
part 'inputs/cena_input.dart';
part 'inputs/cena_field_nolable.dart';
part 'inputs/cena_field_with_label.dart';
part 'inputs/cena_input_label_box.dart';
part 'inputs/cena_input_nolabel_box.dart';
part 'inputs/cena_input_nolabel_button.dart';
part 'inputs/cena_input_password_show.dart';
part 'textfields/cena_focus_text_field.dart';