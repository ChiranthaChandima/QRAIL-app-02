
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrail_fp/utils/constant.dart';


class LoginService {
  static const String baseUrl = Constant.baseurl;

  Future<dynamic> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/UserLogin'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }
}
