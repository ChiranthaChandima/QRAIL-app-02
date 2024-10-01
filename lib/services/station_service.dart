import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrail_fp/models/station.dart';
import 'package:qrail_fp/utils/constant.dart';

class StationService {
  static const String baseUrl = Constant.baseurl;

  Future<List<StationRequest>> fetchStations() async {
    final response = await http.get(
      Uri.parse('$baseUrl/station'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => StationRequest.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch stations');
    }
  }
}