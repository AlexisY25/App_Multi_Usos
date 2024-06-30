import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/gender_model.dart';

class GenderService {
  Future<GenderModel?> getGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    if (response.statusCode == 200) {
      return GenderModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
