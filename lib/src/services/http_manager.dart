// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/constants/keys_api.dart';
import 'package:dio/dio.dart';

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'X-Parse-Application-Id': KeysApi.xParseApplicationId,
        'X-Parse-REST-API-Key': KeysApi.xParseRestApiKey,
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        data: body,
      );
      print(response);
      return response.data;
    } on DioException catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      print(error);
      return {};
    }
  }
}
