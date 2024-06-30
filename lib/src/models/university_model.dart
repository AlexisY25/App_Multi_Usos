class UniversityModel {
  final String name;
  final String country;
  final String webPage;
  final String domain;

  UniversityModel({required this.name, required this.country, required this.webPage, required this.domain});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json['name'],
      country: json['country'],
      webPage: json['web_pages'][0],
      domain: json['domains'][0],
    );
  }
}
