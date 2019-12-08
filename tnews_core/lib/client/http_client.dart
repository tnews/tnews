part of t_core.client;

@immutable
class HttpClient {
  final Dio _dio;

  HttpClient.init(Dio dio) : _dio = dio;

  static Map<String, dynamic> _getParams(Map<String, dynamic> params) => params ?? <String, dynamic>{};

  static Options _getOptions(Options options) =>
      options is Options ? options : Options(responseType: ResponseType.plain);

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic> params, Options options}) {
    return _dio
        .get<String>(path, queryParameters: _getParams(params), options: _getOptions(options))
        .then(_handleResult)
        .catchError((dynamic e) => _handleError(path, e));
  }

  Future<Map<String, dynamic>> post(String path, dynamic body,
      {Map<String, dynamic> params, ProgressCallback onSendProgress, Options options}) {
    return _dio
        .post<String>(path,
            data: body,
            queryParameters: _getParams(params),
            onSendProgress: onSendProgress,
            options: _getOptions(options))
        .then(_handleResult)
        .catchError((dynamic e) => _handleError(path, e));
  }

  Future<Map<String, dynamic>> put(String path, dynamic body, {Options options}) {
    return _dio
        .put<String>(path, data: body, options: _getOptions(options))
        .then(_handleResult)
        .catchError((dynamic e) => _handleError(path, e));
  }

  Future<Map<String, dynamic>> delete<T>(String path, {Options options}) {
    return _dio
        .delete<String>(path, options: _getOptions(options))
        .then(_handleResult)
        .catchError((dynamic e) => _handleError(path, e));
  }

  FutureOr<Map<String, dynamic>> _handleResult(Response<String> response) {
    final String body = response.data;
    return json.decode(body);
  }

  void _handleError(String path, dynamic ex) {
    Logger.debug('path $path - ex: $ex');
    if (ex is DioError) {
      _handleDioError(path, ex);
    } else if (ex is TApiExecption) {
      throw ex;
    } else {
      _handleOtherException(path, ex);
    }
  }

  void _handleDioError(String path, DioError ex) {
    // parse error here
  }

  void _handleOtherException(String path, dynamic ex) {
    try {
      TExeption.fromException(ex);
    } catch (e) {
      Logger.error(e);
      throw ex;
    }
  }
}
