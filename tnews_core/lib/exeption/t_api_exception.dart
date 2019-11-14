part of t_core.exception;

@immutable
class TApiExecption extends TExeption {
  final String reason;

  const TApiExecption({String message, this.reason, String stackStrace})
      : super(message, stackStrace);

  TApiExecption.fromJson(Map<String, dynamic> json)
      : reason = json['reason'],
        super(json['message']);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'reason': reason,
      'stackTrace': stackTrace,
    };
  }

  @override
  String toString() => 'TApiExecption:: $message, $reason, $stackTrace';
}
