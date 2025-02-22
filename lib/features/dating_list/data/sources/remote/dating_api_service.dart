import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:matchify/features/dating_list/data/models/dating_model.dart';

class DatingApiService {
  final dio = Dio();

  Future<DatingModel> fetchDatingEvents() async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      final response = await dio.get('$baseUrl', queryParameters: {"page": 1, "results": 10});
      log('Response Data: ${response.data}');

      log('API_KEY: $baseUrl');
      if (response.statusCode == 200) {
        return DatingModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
