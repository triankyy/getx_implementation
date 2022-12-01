import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_template/core/utils/log.dart';
import 'package:project_template/core/values/api_consts.dart';

class HttpClient {
  static Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<Response<T>> get<T>(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Log.i("GET | ${ApiConstants.baseUrl}$path");
      await EasyLoading.show(
        status: 'mohon tunggu...',
        maskType: EasyLoadingMaskType.black,
      );
      Response<T> response = await dio.get(
        path, 
        queryParameters: queryParameters, 
        options: options, 
        cancelToken: 
        cancelToken, 
        onReceiveProgress: onReceiveProgress
      );
      Log.e("Response : $response");
      await EasyLoading.dismiss();
      return response;
    } on DioError catch (e) {
      print(e);
      EasyLoading.showError(e.message);
      rethrow;
    }
  }

  Future<Response<T>> post<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Log.i("POST | ${ApiConstants.baseUrl}$path");
      await EasyLoading.show(
        status: 'mohon tunggu...',
        maskType: EasyLoadingMaskType.black,
      );
      Response<T> response = await dio.post(path, 
        data: data, 
        queryParameters: queryParameters, 
        options: options, 
        cancelToken: cancelToken, 
        onSendProgress: onSendProgress, 
        onReceiveProgress: onReceiveProgress
      );
      Log.e("Response : $response");
      await EasyLoading.dismiss();
      return response;
    } on DioError catch (e) {
      print(e);
      EasyLoading.showError(e.message);
      rethrow;
    }
  }
}