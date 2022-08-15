class City {
  const City({
    this.id,
    required this.code,
    required this.name,
  });

  final int? id;
  final String code;
  final String name;

  City copyWith({
    int? id,
    String? code,
    String? name,
  }) {
    return City(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int?,
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
    };
  }
}
