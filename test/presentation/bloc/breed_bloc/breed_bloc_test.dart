import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/usecases/get_breeds_usecase.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'breed_bloc_test.mocks.dart';

@GenerateMocks([GetBreedsUseCase])
void main() {
  late MockGetBreedsUseCase mockGetBreedsUseCase;
  late BreedBloc bloc;

  setUp(
    () {
      mockGetBreedsUseCase = MockGetBreedsUseCase();
      bloc = BreedBloc(mockGetBreedsUseCase);
    },
  );

  final breedMaps = List<Map<String, dynamic>>.from(
    json.decode(fixture('breeds_local.json')) as List<dynamic>,
  );
  final tBreedsModel = breedMaps.map(BreedModel.fromMapWithImages).toList();

  test('initialState should be Empty', () {
    expect(
      bloc.state,
      equals(const BreedState.empty()),
    );
  });

  group('GetBreeds', () {
    test(
      'should get data from the use case',
      () async {
        when(mockGetBreedsUseCase.call(any))
            .thenAnswer((_) async => Right(tBreedsModel));
        bloc.add(const BreedEvent.fetch());
        await untilCalled(mockGetBreedsUseCase.call(any));
        verify(mockGetBreedsUseCase.call(any));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        when(mockGetBreedsUseCase.call(any))
            .thenAnswer((_) async => Right(tBreedsModel));
        final expected = [
          const BreedState.loading(),
          BreedState.loaded(tBreedsModel),
        ];
        await expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const BreedEvent.fetch());
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        when(mockGetBreedsUseCase.call(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        const expected = [
          BreedState.loading(),
          BreedState.error('error'),
        ];
        await expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const BreedEvent.fetch());
      },
    );
  });
}
