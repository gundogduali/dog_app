import 'dart:convert';

import 'package:dog_app/data/model/sub_breed_model.dart';
import 'package:equatable/equatable.dart';

class BreedModel extends Equatable {
  const BreedModel({
    required this.name,
    required this.subBreeds,
    this.images = const [],
  });

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    final subBreeds = List<String>.from(map.values.first as List<dynamic>);
    return BreedModel(
      name: map.keys.first,
      subBreeds:
          subBreeds.map<SubBreedModel>((e) => SubBreedModel(name: e)).toList(),
    );
  }

  factory BreedModel.fromMapWithImages(Map<String, dynamic> map) {
    return BreedModel(
      name: map['name'] as String? ?? '',
      subBreeds: List<SubBreedModel>.from(
        (map['subBreeds'] as List<dynamic>).map(
          (e) => SubBreedModel.fromMap(e as Map<String, dynamic>),
        ),
      ),
      images: List<String>.from(map.values.last as List<dynamic>),
    );
  }

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMapWithImages(json.decode(source) as Map<String, dynamic>);

  final String name;
  final List<SubBreedModel> subBreeds;
  final List<String> images;

  @override
  List<Object?> get props => [name, subBreeds, images];

  BreedModel copyWith({
    String? name,
    List<SubBreedModel>? subBreeds,
    List<String>? images,
  }) {
    return BreedModel(
      name: name ?? this.name,
      subBreeds: subBreeds ?? this.subBreeds,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'subBreeds': subBreeds.map((x) => x.toMap()).toList(),
      'images': images,
    };
  }

  String toJson() => json.encode(toMap());
}
