import 'dart:developer';

import 'package:dio/dio.dart';

class ResposeHandle {
  static dynamic handleResponse(Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("=====================SUCCESS======================");
        log("Success: ${response.data}");
        return response.data;
      } else {
        log("Error Response: ${response.statusCode} - ${response.data}");
        throw Exception("Error: ${response.statusCode}, ${response.data}");
      }
    } catch (e) {
      log("Parse Error: $e");
      throw Exception("Failed to handle response: $e");
    }
  }
}
