part of t_core.exception;

@immutable
class TExeption implements Exception {
  final String message;
  final String stackTrace;

  const TExeption([this.message, this.stackTrace]);

  TExeption.fromException(dynamic ex)
      : message = ex.message,
        stackTrace = ex.stackTrace;

  @override
  String toString() => 'Error:: $message $stackTrace';
}
