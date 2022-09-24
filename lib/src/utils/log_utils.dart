// ignore_for_file: unused_element

import 'package:f_logs/f_logs.dart';
import 'package:flutter/foundation.dart';

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

class LogUtils {
  const LogUtils._internal();

  static void init() {
    LogsConfig config = FLog.getDefaultConfigurations()
      ..activeLogLevel = LogLevel.ALL
      ..formatType = FormatType.FORMAT_CUSTOM
      ..fieldOrderFormatCustom = [
        FieldName.TIMESTAMP,
        FieldName.LOG_LEVEL,
        FieldName.CLASSNAME,
        FieldName.METHOD_NAME,
        FieldName.TEXT,
        FieldName.EXCEPTION,
        FieldName.STACKTRACE
      ]
      ..customOpeningDivider = '['
      ..customClosingDivider = ']';
    FLog.applyConfigurations(config);
  }

  static void debug(String className, String methodName, String? message) {
    try {
      FLog.debug(
        className: '\x1B[32m$className\x1B[0m',
        methodName: '\x1B[35m$methodName\x1B[0m',
        text: message != null ? '\x1B[33m$message\x1B[0m' : 'null',
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print('\x1B[31m[debug] [${e.toString()}]\x1B[0m');
      }
    }
  }

  static void error(String className, String methodName, dynamic exception) {
    try {
      FLog.error(
        className: className,
        methodName: methodName,
        text: exception == null
            ? 'null'
            : '\x1B[31m${exception.toString()}\x1B[0m',
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print('[LogUtils] [error] [${e.toString()}]');
      }
    }
  }

  static void _printLogs() {
    FLog.printLogs();
  }

  static Future<void> _export() async {
    await FLog.exportLogs();
  }

  static Future<void> _clear() async {
    await FLog.clearLogs();
  }
}
