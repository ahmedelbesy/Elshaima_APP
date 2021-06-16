
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(

      BaseOptions(
        baseUrl: "https://app.infratechtechnology.org/api/",
   receiveDataWhenStatusError: true,
          validateStatus: (status) { return status < 600; }

      ),

    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };

    return await dio.get(url, queryParameters: query ?? null);
  }

  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String token,
  }) async {

    dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };

    return dio.post(url, queryParameters: query, data: data);
  }
}


dynamic _handelResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.toString());
      return responseJson;
    case 400:
      var jsonResponse = 'unauth';
      return jsonResponse;
    case 401:
      var jsonResponse = 'unauth';
      return jsonResponse;
    case 403:
      var jsonResponse = 'unauth';
      return jsonResponse;
    case 500:
      var jsonResponse = 'server error';
      return jsonResponse;

    default:
      var jsonResponse = 'server error';
      return jsonResponse;
  }
}