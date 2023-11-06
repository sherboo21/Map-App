import 'dart:convert';
import 'package:dio/dio.dart';

AppExceptions returnErrors(Response response) {
  String errorMessage = '';
  var responseJson =
      json.decode(response.data.toString()) as Map<String, dynamic>;
  responseJson.forEach((key, value) {
    value.forEach((element) {
      errorMessage += element + ' ';
    });
  });
  return AppExceptions(errorMessage.trim());
}

class AppExceptions implements Exception {
  final String _message;

  AppExceptions(this._message);

  @override
  String toString() {
    return _message;
  }
}

class CacheException implements Exception {}
