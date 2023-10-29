import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/usecases/get_random_breed_image_usecase.dart';
import 'package:dog_app/presentation/bloc/bloc/breed_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'breed_detail_bloc_test.mocks.dart';

@GenerateMocks([GetRandomBreedImageUseCase])
void main() {
  late MockGetRandomBreedImageUseCase mockGetRandomBreedImageUseCase;
  late BreedDetailBloc bloc;

  final breedMaps = List<Map<String, dynamic>>.from(
    json.decode(fixture('breeds_local.json')) as List<dynamic>,
  );
  final tBreedsModel = breedMaps.map(BreedModel.fromMapWithImages).toList();
  setUp(
    () {
      mockGetRandomBreedImageUseCase = MockGetRandomBreedImageUseCase();

      bloc = BreedDetailBloc(
        tBreedsModel.first,
        mockGetRandomBreedImageUseCase,
      );
    },
  );

  test('initialState test', () {
    expect(
      bloc.state,
      equals(
        BreedDetailState(
          breed: tBreedsModel.first,
          imageUrl: tBreedsModel.first.image,
          isLoading: false,
        ),
      ),
    );
  });

  group('GetRandomBreedImage', () {
    test(
      'should get data from the use case',
      () async {
        when(mockGetRandomBreedImageUseCase.call(any))
            .thenAnswer((_) async => const Right(''));
        bloc.add(const BreedDetailEvent.generate());
        await untilCalled(mockGetRandomBreedImageUseCase.call(any));
        verify(mockGetRandomBreedImageUseCase.call(any));
      },
    );
  });
}
