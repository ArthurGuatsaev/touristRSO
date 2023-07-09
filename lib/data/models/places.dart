import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Places {
  final String nameRu;
  final String nameEn;
  final List<dynamic> image;
  final String descriptionRu;
  final String descriptionEn;
  final String coordinates;
  const Places({
    required this.nameRu,
    required this.nameEn,
    required this.image,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.coordinates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameRu': nameRu,
      'nameEn': nameEn,
      'image': image,
      'descriptionRu': descriptionRu,
      'descriptionEn': descriptionEn,
      'coordinates': coordinates,
    };
  }

  factory Places.fromMap(Map<String, dynamic> map) {
    return Places(
      nameRu: map['nameRu'] as String,
      nameEn: map['nameEn'] as String,
      image: List<dynamic>.from((map['image'] as List<dynamic>)),
      descriptionRu: map['descriptionRu'] as String,
      descriptionEn: map['descriptionEn'] as String,
      coordinates: map['coordinates'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Places.fromJson(String source) => Places.fromMap(json.decode(source) as Map<String, dynamic>);

  Places copyWith({
    String? nameRu,
    String? nameEn,
    List<dynamic>? image,
    String? descriptionRu,
    String? descriptionEn,
    String? coordinates,
  }) {
    return Places(
      nameRu: nameRu ?? this.nameRu,
      nameEn: nameEn ?? this.nameEn,
      image: image ?? this.image,
      descriptionRu: descriptionRu ?? this.descriptionRu,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      coordinates: coordinates ?? this.coordinates,
    );
  }
}
