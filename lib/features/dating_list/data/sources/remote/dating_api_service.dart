import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:matchify/features/dating_list/data/models/dating_model.dart';

class DatingApiService {
  final dio = Dio();

  Future<List<DatingModel>> fetchDatingEvents() async {
    try {
      final response = await dio.get(dotenv.env['API_KEY']!, queryParameters: {"page": 1, "results": 10});
      log('Response: $response');
      log('API_KEY: ${dotenv.env['API_KEY']}');
      if (response.statusCode == 200) {
        final List users = response.data['results'];
        return users.map((data) => DatingModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
