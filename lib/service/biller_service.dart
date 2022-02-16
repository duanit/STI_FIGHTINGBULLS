// import 'dart:convert';
// import 'package:cspay/src/constants/api.dart';
// import 'package:cspay/src/models/biller_model.dart';
// import 'package:dio/dio.dart';
// import 'package:cspay/src/services/network_service.dart';

import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:dio/dio.dart';
import 'package:sti_fightingbulls/dao/messageuser_dao.dart';
import 'package:sti_fightingbulls/models/biller_model.dart';

class BillerService {
  BillerService._internal();

  static final BillerService _instance = BillerService._internal();

  factory BillerService() => _instance;

  // static final _dio = Dio()
  //   ..interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         options.baseUrl = 'http://192.168.1.75:3000/api';
  //         options.connectTimeout = 5000;
  //         options.receiveTimeout = 3000;
  //         print(options.baseUrl + options.path);
  //         return handler.next(options);
  //       },
  //       onResponse: (response, handler) {
  //         return handler.next(response);
  //       },
  //       onError: (DioError e, handler) {
  //         return handler.next(e);
  //       },
  //     ),
  //   );
  static final _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.baseUrl =
              'https://backend-v3.cspay-staging.aureus-internal.nl/api';
          options.connectTimeout = 5000;
          options.receiveTimeout = 3000;
          print(options.baseUrl + options.path);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );

  Future<List<Biller>> getBiller(String BillerTypeId) async {
    final url =
        'https://backend-v3.cspay-staging.aureus-internal.nl/bill-pay/api/biller/' +
            BillerTypeId;
    // print("++++++++url+++++++");
    // print(url);
    final Response response = await Dio().get(url);
    // print("++++++++getBiller+++++++");
    // print(response.data);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      return BillerFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
