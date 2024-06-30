import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/age_model.dart';

class AgeService {
  Future<AgeModel?> getAge(String name) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));

    if (response.statusCode == 200) {
      return AgeModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
