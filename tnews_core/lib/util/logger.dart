library t_core.utils;

import 'dart:math';

import 'package:ansicolor/ansicolor.dart';
import 'package:intl/intl.dart';

part 'string_converter.dart';
part 'thinid.dart';
part 'time_converter.dart';

abstract class Logger {
  static final _debugCode = chooseLogColor(LogLevel.DEBUG);
  static final _infoCode = chooseLogColor(LogLevel.INFO);
  static final _warnCode = chooseLogColor(LogLevel.WARN);
  static final _errorCode = chooseLogColor(LogLevel.ERROR);

  static void debug(dynamic data) {
    _print(_debugCode, 'log_debug:: $data');
  }

  static void info(dynamic data) {
    _print(_infoCode, 'log_info:: $data');
  }

  static void warn(dynamic data) {
    _print(_warnCode, 'log_warn:: $data');
  }

  static void error(dynamic data) {
    _print(_errorCode, 'log_error:: $data');
  }

  static void _print(AnsiPen code, dynamic data) {
    // ignore: avoid_print
    print(code(data));
  }
}

enum LogLevel {
  DEBUG,
  INFO,
  WARN,
  ERROR,
  ALL,
}

/// Chooses a color based on the logger [level].
AnsiPen chooseLogColor(LogLevel level) {
  switch (level) {
    case LogLevel.ALL:
      return AnsiPen()..white();
    case LogLevel.DEBUG:
      return AnsiPen()..green();
    case LogLevel.INFO:
      return AnsiPen()..blue();
    case LogLevel.WARN:
      return AnsiPen()..yellow();
    case LogLevel.ERROR:
      return AnsiPen()..red();
    default:
      return AnsiPen()..white();
  }
}
