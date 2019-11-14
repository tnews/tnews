library t_core.util;

import 'package:flutter/foundation.dart';

class Log {
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
