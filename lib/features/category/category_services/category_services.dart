import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_shahin/features/auth/auth_services/auth_services.dart';
import 'package:project_shahin/features/category/model/category_model.dart';

class CategoryService {
  late final Dio _dio;
  final String _baseUrl = dotenv.env['BASE_URL'] ?? '';


  CategoryService() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
  
  Future<List<CategoryModel>> getCategories(String accessToken) async {
  final response = await _dio.get(
    'api/categories/',
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    ),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = response.data is String
        ? jsonDecode(response.data)
        : response.data;
    debugPrint('!-------------${response.data}');
    return jsonList.map((json) {
      return CategoryModel.fromJson(json as Map<String, dynamic>);
    }).toList();
  } else {
    throw Exception('Failed to load categories: ${response.data}');
  }
}

  Future<void> postSelectedCategories(List<String> selected) async {
     final accessToken = await AuthService().getToken();
    final response = await _dio.post(
      'api/categories/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
      data: jsonEncode({'selected_categories': selected}),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to post selected categories: ${response.data}');
    }
  }
}
