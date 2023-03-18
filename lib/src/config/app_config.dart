import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppConfig {
  // ------------------------------------
  // REQUIRED
  // ------------------------------------

  /// default locale
  static const locale = Locale('vi');

  /// fallback locale
  static const fallbackLocale = Locale('en');

  /// config code
  static const String configCode = "cenafoodie-dev";

  /// deployment id (tenant id)
  static const String deploymentId = "master";

  /// package name
  static const String packageName = "cena_foodie";

  /// storage box
  static const String storageBox = packageName;

  /// default transition
  static const PageTransitionType defaultTransition = PageTransitionType.fade;

  // ------------------------------------
  // OPTIONAL
  // ------------------------------------

  // ------------------------------------
  // PRIVACY
  // ------------------------------------
}
