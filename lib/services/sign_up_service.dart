import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrail_fp/models/user.dart';

import 'package:qrail_fp/utils/constant.dart';

class SignUpService {
  static const String baseUrl = Constant.baseurl;

  Future<Map<String, dynamic>> signUp(SignUpRequest signUpRequest) async {
    final response = await http.post(
      Uri.parse('$baseUrl/userlogin/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(signUpRequest.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
