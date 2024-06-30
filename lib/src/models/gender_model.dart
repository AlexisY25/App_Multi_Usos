class GenderModel {
  final String name;
  final String gender;
  final double probability;

  GenderModel({required this.name, required this.gender, required this.probability});

  factory GenderModel.fromJson(Map<String, dynamic> json) {
    return GenderModel(
      name: json['name'],
      gender: json['gender'],
      probability: (json['probability'] as num).toDouble(),
    );
  }
}
