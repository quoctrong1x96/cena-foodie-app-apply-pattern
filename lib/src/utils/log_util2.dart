// ignore_for_file: unused_element, deprecated_member_use

import 'package:logger/logger.dart';

/*
Black:   \x1B[30m
Red:     \x1B[31m
Green:   \x1B[32m
Yellow:  \x1B[33m
Blue:    \x1B[34m
Magenta: \x1B[35m
Cyan:    \x1B[36m
White:   \x1B[37m
Reset:   \x1B[0m8
*/

class LogUtil2 {
  // Private Constructor
  const LogUtil2._privateConstructor();

  // Singleton instance
  static final LogUtil2 instance = LogUtil2._privateConstructor();

  // LogUtil2 Initialize instance
  static final Logger _logger = Logger(
    printer: PrettyPrinter(  // Customize log output
      methodCount: 2,       // Number of method calls to display
      errorMethodCount: 5,  // Number of error method calls to display
      lineLength: 80,       // Width of the output
      colors: true,         // Enable colored logs
      printEmojis: true,    // Use emojis for log levels
      // printTime: true,      // Display log time
    ),
  );

  // Static methods for different log levels
  static void debug(String className, String methodName, String? message) {
    _logger.d(message);
  }

  // static void debug(String className, String methodName, String? message) {
  //   try {
  //     FLog.debug(
  //       className: '\x1B[32m$className\x1B[0m',
  //       methodName: '\x1B[35m$methodName\x1B[0m',
  //       text: message != null ? '\x1B[33m$message\x1B[0m' : 'null',
  //     );
  //   } on Exception catch (e) {
  //     if (kDebugMode) {
  //       print('\x1B[31m[debug] [${e.toString()}]\x1B[0m');
  //     }
  //   }
  // }

  static void info(String className, String methodName, String? message) {
    _logger.i(message);
  }

  static void warning(String className, String methodName, String? message) {
    _logger.w(message);
  }

  static void error(String className, String methodName, String? message) {
    _logger.e(message);
  }

  static void verbose(String className, String methodName, String? message) {
    _logger.v(message);
  }

}
