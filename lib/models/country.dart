class Country {
  final String name;
  final String id;
  final String image;

  Country({required this.name, required this.id, required this.image});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
