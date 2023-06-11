import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..options.contentType = Headers.jsonContentType
      // ..options.headers["authorization"] =
      //     "Bearer ${SharedPreference.authToken}"
      ..interceptors.add(
          PrettyDioLogger(requestBody: true, compact: true, request: true));
  }
  updateBaseUrl( {String baseUrl=Endpoints.baseUrl})
  {
    _dio..options.baseUrl = baseUrl;
  }
  //
  // Add methods...
  // Get:-----------------------------------------------------------------------
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    // debugPrint("------------>>>>  Bearer ${SharedPreference.authToken}");
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

class Endpoints {
  Endpoints._();

  //baseUrl
  static const String baseUrl = "https://appopen.me/api/";

  static const String webUrl = "https://appopen.me";

  static const String baseUrl2 = "https://earningdesire.com/apps-api/";


  // receiveTimeout
  static const int receiveTimeout = 120 * 1000; // 120 sec

  // connectTimeout
  static const int connectionTimeout = 120 * 1000; // 120 sec

  // Endpoints
  static const String createShort = "createShort";
  static const String shortCodeInfo = "shortCodeDetails";
  static const String getTotalLinks = "getTotalLinks";
  static const String appPromoData = "app-data-4-keyword-tool.php";
}
