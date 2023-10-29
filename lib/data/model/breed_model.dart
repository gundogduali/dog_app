import 'dart:convert';

import 'package:dog_app/data/model/sub_breed_model.dart';
import 'package:equatable/equatable.dart';

class BreedModel extends Equatable {
  const BreedModel({
    required this.name,
    required this.subBreeds,
    required this.image,
  });

  factory BreedModel.empty() => const BreedModel(name: '', subBreeds: [],image: '');

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    final subBreeds = List<String>.from(map.values.first as List<dynamic>);
    return BreedModel(
      name: map.keys.first,
      subBreeds:
          subBreeds.map<SubBreedModel>((e) => SubBreedModel(name: e)).toList(),
      image: '',
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
      image: map['image'] as String? ?? '',
    );
  }

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMapWithImages(json.decode(source) as Map<String, dynamic>);

  final String name;
  final List<SubBreedModel> subBreeds;
  final String image;

  @override
  List<Object?> get props => [name, subBreeds, image];

  BreedModel copyWith({
    String? name,
    List<SubBreedModel>? subBreeds,
    String? image,
  }) {
    return BreedModel(
      name: name ?? this.name,
      subBreeds: subBreeds ?? this.subBreeds,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'subBreeds': subBreeds.map((x) => x.toMap()).toList(),
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
