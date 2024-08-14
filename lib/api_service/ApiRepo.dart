import 'dart:convert';

import 'package:mvvm_application/api_service/ApiResponse.dart';
import 'package:mvvm_application/api_service/ApiService.dart';
import 'package:mvvm_application/model/UserModel.dart';

class ApiRepository {
  final ApiService _apiService = ApiService();

  Future<List<UserModel>> getUserPostFromServer() async {
    try {
      final data = await _apiService.getUsers('/users');

      return UserModel.fromJsonList(jsonDecode(data));
    } catch (e) {
      throw ResponseHandling().getExceptionString(e);
    }
  }
}
