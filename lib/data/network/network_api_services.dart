import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_flutter/data/exception/app_expection.dart';
import 'package:bloc_flutter/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkServisesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException("No Internet connection");
    } on TimeoutException {
      throw FetchDataException("Time out try Again");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));
      responseJson = returnResponse(response);
      // if (response.statusCode == 200) {

      // }
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException("Time out try Again");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException(response.statusCode.toString());

      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
