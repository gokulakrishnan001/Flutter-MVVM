


import 'package:http/http.dart' as http;
import 'package:mvvm_application/api_service/ApiConstant.dart';
import 'package:mvvm_application/api_service/ApiResponse.dart';

class ApiService {
  final _baseUrl = ApiConstant.BASE_URL;
   final client = http.Client();
  

    Future<String> getUsers(String endpoint) async {
    try {
      Uri uri = Uri.http(_baseUrl,  endpoint);

      final response = await client.get(uri, headers: setHeaders());
      return ResponseHandling().processResponse(response);
    } catch (e) {
      return ResponseHandling().getExceptionString(e);
    }
  }

  setHeaders() => {
        'Content-Type': 'application/json; charset=UTF-8',
      };
}
