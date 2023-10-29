// ignore_for_file: inference_failure_on_instance_creation

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dog_app/core/usecases/usecase.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/usecases/get_breeds_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'get_breeds_usecase_test.mocks.dart';

@GenerateMocks([BreedRepository])
void main() {
  late GetBreedsUseCase useCase;
  late MockBreedRepository mockRepository;

  setUp(
    () {
      mockRepository = MockBreedRepository();
      useCase = GetBreedsUseCase(repository: mockRepository);
    },
  );
  final breedMaps = List<Map<String, dynamic>>.from(
    json.decode(fixture('breeds_local.json')) as List<dynamic>,
  );
  final tBreedsModel = breedMaps.map(BreedModel.fromMapWithImages).toList();

  test(
    'should get breeds from the repository',
    () async {
      when(mockRepository.getBreeds())
          .thenAnswer((_) async => Right(tBreedsModel));
      final result = await useCase.call(NoParams());
      expect(result, Right(tBreedsModel));
      verify(mockRepository.getBreeds());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
