import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'config.dart';
import 'utils.dart';

class CustomInterceptors extends Interceptor {
  final _log = Logger();
  StreamSubscription? subscription;

  CustomInterceptors();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await handleListenConnect) {
      Utils.messWarning(MSG_NOT_CONNECT);
      return;
    }
    //   "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
    // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    // "Access-Control-Allow-Methods": "POST, OPTIONS"
    options.baseUrl = kUrl;
    options.headers['Content-Type'] = 'application/json';
    options.headers['Access-Control-Allow-Origin'] = '*';
    options.headers['Access-Control-Allow-Credentials'] = true;
    options.headers['Access-Control-Allow-Headers'] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    options.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS';
    _log.i(
        'TYPE: Request,\nPATH: ${options.path},\nMETHOD: ${options.method},\nDATA: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log.i(
        'TYPE: Reponse,\nSTATUSCODE: ${response.statusCode},\nPATH: ${response.requestOptions.path},\nMETHOD: ${response.requestOptions.method},\nDATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _log.e(
        'TYPE: DioError,\nSTATUSCODE: ${err.response!.statusCode},\nPATH: ${err.requestOptions.path},\nMETHOD: ${err.requestOptions.method},\nMESSAGE: ${err.message}');
    if (err.type == DioErrorType.receiveTimeout) {
      Utils.messWarning(MSG_TIME_OUT);
      return;
    }
    super.onError(err, handler);
  }

  Future<bool> get handleListenConnect async {
    var result = true;
    final connectResult = await Connectivity().checkConnectivity();
    if (connectResult == ConnectivityResult.none) {
      result = false;
    }
    return result;
  }
}
