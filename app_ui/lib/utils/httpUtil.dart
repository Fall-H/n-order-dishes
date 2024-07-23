/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/common/application_context.dart';
import 'package:cry/constants/cry_constant.dart';
import 'package:cry/model/cry_properties.dart';
import 'package:cry/model/response_body_api.dart';
import 'package:cry/utils/cry_utils.dart';
import 'package:dio/dio.dart';

import '../config/envConfig.dart';

class HttpUtil {
  static Dio? dio;
  static const String POST = 'post';
  static const String GET = 'get';
  static String authorization = "ab37a69748a711efb8542cf05def5548";

  static Future<ResponseBodyApi> get(String url, {data, requestToken = true}) async {
    return await request(url, data: data, requestToken: requestToken, method: GET);
  }

  static Future<ResponseBodyApi> post(String url, {data, requestToken = true}) async {
    return await request(url, data: data, requestToken: requestToken);
  }

  static Future<ResponseBodyApi> request(String url, {data, method, requestToken = true}) async {
    data = data ?? {};
    method = method ?? POST;

    Dio dio = createInstance()!;

    if (authorization != "") {
      dio.options.headers["Authorization"] = authorization;
    }

    dio.options.method = method;

    ResponseBodyApi responseBodyApi;
    try {
      Response res = await dio.request(url, data: data);
      responseBodyApi = ResponseBodyApi.fromMap(res.data);
    } catch (e) {
      responseBodyApi = ResponseBodyApi(success: false, message: '请求出错了：' + e.toString());
    }

    return responseBodyApi;
  }

  static Dio? createInstance() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: Env.envConfig.baseUrl,
        connectTimeout: Env.envConfig.connectTimeout,
        receiveTimeout: Env.envConfig.receiveTimeout,
      );

      dio = new Dio(options);
      List<Interceptor>? list = ApplicationContext.instance.getBean(CryConstant.KEY_DIO_INTERCEPTORS);
      if (list != null && list.isNotEmpty) {
        dio!.interceptors.addAll(list);
      }
    }

    return dio;
  }

  static clear() {
    dio = null;
  }
}