//import 'dart:convert';

//import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com';

class BaseClient {
  var client = http.Client();
  final logger = Logger(level: Level.debug);

  // Get
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    //logger.d(url);

    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    try {
      var response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        //throw exception and catch it in UI
      }
    } catch (e) {
      // handle the error here
      logger.e(e);
    }
  }

  // Post
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
