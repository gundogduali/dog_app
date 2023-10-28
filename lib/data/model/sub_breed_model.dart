import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubBreedModel extends Equatable {
  const SubBreedModel({
    required this.name,
    this.images = const [],
  });

  factory SubBreedModel.fromMap(Map<String, dynamic> map) {
    return SubBreedModel(
      name: map['name'] as String,
      images: List<String>.from(
        map['images'] as List<String>,
      ),
    );
  }

  factory SubBreedModel.fromJson(String source) =>
      SubBreedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final List<String> images;
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'images': images,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, images];
}
