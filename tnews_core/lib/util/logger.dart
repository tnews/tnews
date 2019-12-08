library t_core.utils;

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

part "string_converter.dart";
part 'thinid.dart';
part 'time_converter.dart';

class Logger {
  static void debug(dynamic data) {
    printConsole("log_debug:: $data");
  }

  static void info(dynamic data) {
    printConsole("log_info:: $data");
  }

  static void error(dynamic data) {
    printConsole("log_error:: $data");
  }

  static void printConsole(dynamic data) {
    if (!kReleaseMode) {
      debugPrint(data);
    }
  }
}
