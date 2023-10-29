// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/usecases/get_random_breed_image_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_random_breed_image_usecase_test.mocks.dart';

@GenerateMocks([BreedRepository])
void main() {
  late MockBreedRepository mockRepository;
  late GetRandomBreedImageUseCase useCase;

  setUp(
    () {
      mockRepository = MockBreedRepository();
      useCase = GetRandomBreedImageUseCase(repository: mockRepository);
    },
  );

  test(
    'should get random breed image from the repository',
    () async {
      when(mockRepository.getBreedImagesByRandom(any))
          .thenAnswer((_) async => const Right(''));
      final result =
          await useCase.call(const GetRandomBreedImageParams(breedName: ''));
      expect(result, const Right(''));
      verify(mockRepository.getBreedImagesByRandom(any));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
