part of t_core.utils;

abstract class TimeConverter {
  static const String _queryRegex = r'\d{1,2}\/\d{1,2}\/\d{4},\s\d{0,2}:\d{0,2}';
  static final RegExp _regExp = RegExp(_queryRegex);
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyy, HH:mm');

  static DateTime stringToDateTime(String time) {
    if (time?.isEmpty ?? true) return null;
    try {
      time = _regExp.stringMatch(time);
      return _dateFormat.parse(time);
    } catch (ex) {
      Logger.debug('TimeConverter.stringToDateTime $ex');
      return null;
    }
  }
}
