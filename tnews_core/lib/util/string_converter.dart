part of t_core.utils;

abstract class StringConverter {
  static final RegExp _regExp = RegExp(r'\r|\n');
  static String removeNewsLine(String text) {
    return text.replaceAll(_regExp, '')?.trim();
  }

  static String toPascalCase(String text) {
    if (text != null) {
      final List<String> words = getListWordFromString(text);
      return words.fold<String>(
          '',
          (String total, String word) => total.isEmpty
              ? _upperCaseFirstCharacter(word)
              : '$total ${_upperCaseFirstCharacter(word)}');
    } else
      return null;
  }

  static String _upperCaseFirstCharacter(String word) {
    return '${word[0].toUpperCase()}${word.substring(1)}';
  }

  static List<String> getListWordFromString(String value) {
    return <String>[]..addAll(value
            ?.replaceAll(RegExp(r'\n|\r'), ' ')
            ?.split(RegExp(r"\s+"))
            ?.where((String word) => word.isNotEmpty) ??
        <String>[],);
  }
}
