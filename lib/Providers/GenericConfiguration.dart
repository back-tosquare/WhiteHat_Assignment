import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

mixin GenericConfiguration {
  void genericErrorHandler(error) {
    throw error;
  }

  Map<String, String> _getHeaders({String token}) {
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    if (token != null) {
      header[HttpHeaders.authorizationHeader] = "Token $token";
    }

    return header;
  }

  Future<dynamic> postHandler(
      {@required String url,
      @required Map<String, String> authData,
      String token}) {
    Map<String, String> headers = _getHeaders(token: token);
    return http
        .post(url, body: json.encode(authData), headers: headers)
        .then((response) => json.decode(response.body))
        .catchError(genericErrorHandler);
  }

  Future<dynamic> getHandler({@required String url, String token}) {
    Map<String, String> headers = _getHeaders(token: token);

    return http
        .get(url, headers: headers)
        .then((response) => json.decode(response.body))
        .catchError(genericErrorHandler);
  }
}
