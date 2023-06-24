import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../data/app_locator.dart';
import '../../../../../data/models/entities/category/category.dart';
import '../../../../../data/models/ui/ui_response.dart';
import '../../../../../data/services/entities/category_service.dart';
import '../../../../../utils/constants/route_constants.dart';
import '../../../../../utils/image_ultils.dart';
import '../../../../../utils/navigation_utils.dart';
import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/cart/cart_bloc.dart';
import '../../../../widgets/widgets.dart';

part './header.dart';
part './futures.dart';
