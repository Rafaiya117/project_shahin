import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_shahin/features/auth/auth_models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  late final Dio _dio;
  final String _baseUrl = dotenv.env['BASE_URL'] ?? '';

  AuthService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }

  // ---------------- TOKEN HANDLING ---------------- //
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }

  Future<Options> _authorizedHeader() async {
    final token = await getToken();
    return Options(
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // ---------------- AUTH REQUESTS ---------------- //

  Future<Map<String, dynamic>> login(String email, String password) async {
  try {
    final response = await _dio.post(
      'api/auth/login/',
      data: jsonEncode({'email': email, 'password': password}),
    );

    final data = response.data is String ? jsonDecode(response.data) : response.data;
    if (response.statusCode == 200 && data['data']?['access'] != null) {
      final token = data['data']['access'];
      await saveToken(token);

      final user = UserModel.fromJson(data['data']['user']);
      return {
        'success': true,
        'data': {
          'token': token,
          'refresh': data['data']['refresh'],
          'user': user,
        },
      };
    }
    final errorMessage = data['detail'] ?? data['message'] ?? 'Login failed';
    return {
      'success': false,
      'error': errorMessage,
    };
  } on DioException catch (e) {
    // Keep your existing error handler
    return {'success': false, 'error': _handleError(e)};
  }
}

  Future<Map<String, dynamic>> signup(String email, String password, String name, String dateOfBirth) async {
  try {
    final Map<String, dynamic> payload = {
      'email': email,
      'password': password,
      'full_name': name,
    };
    if (dateOfBirth.isNotEmpty) {
      payload['date_of_birth'] = dateOfBirth;
    }

    final response = await _dio.post(
      'api/auth/signup/',
      data: jsonEncode(payload),
    );

    final data = response.data is String ? jsonDecode(response.data) : response.data;

    final userData = data['data']?['user'];
    final user = userData != null ? UserModel.fromJson(userData) : null;

    final bool success = data['success'] ?? false;

    return {
      'success': success,
      'message': data['message'] ?? 'Signup successful',
      'data': {'user': user, 'access': data['data']?['access'], 'refresh': data['data']?['refresh']},
    };
  } on DioException catch (e) {
    return {
      'success': false,
      'error': _handleError(e),
    };
  }
}

  Future<Map<String, dynamic>> sendOtp(String email) async {
    try {
      final response = await _dio.post(
        '/send-otp/',
        options: await _authorizedHeader(),
        data: jsonEncode({'email': email}),
      );

      final data = response.data is String ? jsonDecode(response.data) : response.data;

      return {
        'success': response.statusCode == 200,
        'message': data['message'] ?? 'OTP sent',
      };
    } on DioException catch (e) {
      return {'success': false, 'error': _handleError(e)};
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    try {
      final response = await _dio.post(
        'api/auth/otp/verify/',
        options: await _authorizedHeader(),
        data: jsonEncode({'email': email, 'otp': otp}),
      );

      final data =
          response.data is String ? jsonDecode(response.data) : response.data;

      final userData = data['data']?['user'];
      final user = userData != null ? UserModel.fromJson(userData) : null;

      return {
        'success': response.statusCode == 200,
        'message': data['message'] ?? 'OTP verified',
        'data': {'user': user},
      };
    } on DioException catch (e) {
      return {'success': false, 'error': _handleError(e)};
    }
  }

  Future<Map<String, dynamic>> resetPassword(String email,String newPassword, String confirmoassword) async {
    try {
      final response = await _dio.post(
        'api/auth/password/reset/',
        options: await _authorizedHeader(),
        data: jsonEncode({
          'email': email,
          'new_password': newPassword,
          'confirm_password':confirmoassword
        }),
      );

      final data = response.data is String ? jsonDecode(response.data) : response.data;

      final userData = data['data']?['user'];
      final user = userData != null ? UserModel.fromJson(userData) : null;

      return {
        'success': response.statusCode == 200,
        'message': data['message'] ?? 'Password reset successful',
        'data': {'user': user},
      };
    } on DioException catch (e) {
      return {'success': false, 'error': _handleError(e)};
    }
  }

  Future<Map<String, dynamic>> changePassword(
      String oldPassword, String newPassword) async {
    try {
      final response = await _dio.post(
        '/change-password/',
        options: await _authorizedHeader(),
        data: jsonEncode({
          'old_password': oldPassword,
          'new_password': newPassword,
        }),
      );

      final data = response.data is String ? jsonDecode(response.data) : response.data;

      final userData = data['data']?['user'];
      final user = userData != null ? UserModel.fromJson(userData) : null;

      return {
        'success': response.statusCode == 200,
        'message': data['message'] ?? 'Password changed successfully',
        'data': {'user': user},
      };
    } on DioException catch (e) {
      return {'success': false, 'error': _handleError(e)};
    }
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      final response = await _dio.post(
        'api/auth/otp/send/',
        options: await _authorizedHeader(),
        data: jsonEncode({'email': email}),
      );

      final data = response.data is String ? jsonDecode(response.data) : response.data;

      final userData = data['data']?['user'];
      final user = userData != null ? UserModel.fromJson(userData) : null;

      return {
        'success': response.statusCode == 200,
        'message': data['message'] ?? 'Password reset initiated',
        'data': {'user': user},
      };
    } on DioException catch (e) {
      return {'success': false, 'error': _handleError(e)};
    }
  }

  // ---------------- ERROR HANDLER ---------------- //
  String _handleError(DioException e) {
  debugPrint("DioException response: ${e.response?.data}");

  if (e.response != null && e.response!.data != null) {
    final data = e.response!.data;

    if (data is Map<String, dynamic>) {
      return data['detail'] ?? data['message'] ?? 'Request failed';
    } else if (data is String) {
      try {
        final decoded = jsonDecode(data);
        return decoded['detail'] ?? decoded['message'] ?? 'Request failed';
      } catch (_) {
        return data; 
      }
    }
  }

  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout) {
    return 'Connection timeout. Try again.';
  }
    return e.message ?? 'Something went wrong. Please try later.';
  }
}
