import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/university_model.dart';

class UniversityService {
  Future<List<UniversityModel>> getUniversities(String country) async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$country'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((university) => UniversityModel.fromJson(university)).toList();
    } else {
      throw Exception('Failed to load universities');
    }
  }
}
