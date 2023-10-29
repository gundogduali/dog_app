// ignore_for_file: inference_failure_on_instance_creation, lines_longer_than_80_chars

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/exceptions.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/core/network/network_info.dart';
import 'package:dog_app/data/core/app_cache_manager.dart';
import 'package:dog_app/data/local/breed_local_data_source.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/data/remote/breed_remote_data_source.dart';
import 'package:dog_app/data/repositories/breed_repository_impl.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'breed_repository_test.mocks.dart';

@GenerateMocks(
  [BreedRemoteDataSource, BreedLocalDataSource, NetworkInfo, AppCacheManager],
)
void main() {
  late BreedRepository repository;
  late MockBreedRemoteDataSource mockRemoteDataSource;
  late MockBreedLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockAppCacheManager mockAppCacheManager;

  setUp(
    () {
      mockRemoteDataSource = MockBreedRemoteDataSource();
      mockLocalDataSource = MockBreedLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();
      mockAppCacheManager = MockAppCacheManager();
      repository = BreedRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo,
        cacheManager: mockAppCacheManager,
      );
    },
  );

  group('Breed Repository', () {
    final breedMaps = List<Map<String, dynamic>>.from(
      json.decode(fixture('breeds_local.json')) as List<dynamic>,
    );
    final tBreedsModel = breedMaps.map(BreedModel.fromMapWithImages).toList();
    group(
      'Device is online',
      () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        test(
          'should check if the device is online',
          () async {
            // act
            await repository.getBreeds();
            // assert
            verify(mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return remote data when the call to remote data source is successful',
          () async {
            when(mockRemoteDataSource.getBreeds())
                .thenAnswer((_) async => tBreedsModel);
            final result = await repository.getBreeds();
            verify(mockRemoteDataSource.getBreeds());
            expect(result, equals(Right(tBreedsModel)));
          },
        );
        test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
            when(mockRemoteDataSource.getBreeds())
                .thenAnswer((_) async => tBreedsModel);
            await repository.getBreeds();
            verify(mockRemoteDataSource.getBreeds());
            verify(mockLocalDataSource.cacheBreeds(tBreedsModel, any));
          },
        );
        test(
          'should return ServerFailure when the call to remote data source is unsuccessful',
          () async {
            when(mockRemoteDataSource.getBreeds()).thenThrow(ServerException());
            final result = await repository.getBreeds();
            verify(mockRemoteDataSource.getBreeds());
            expect(result, equals(Left(ServerFailure())));
          },
        );
      },
    );
    group(
      'Device is offline',
      () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });
        test(
          'should check if the device is offline',
          () async {
            await repository.getBreeds();
            verify(mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return local data when the call to local data source is successful',
          () async {
            when(mockLocalDataSource.getBreeds())
                .thenAnswer((_) async => tBreedsModel);
            final result = await repository.getBreeds();
            verify(mockLocalDataSource.getBreeds());
            expect(result, equals(Right(tBreedsModel)));
          },
        );

        test(
          'should return CacheFailure when the call to local data source is unsuccessful',
          () async {
            when(mockLocalDataSource.getBreeds()).thenThrow(CacheException());
            final result = await repository.getBreeds();
            verify(mockLocalDataSource.getBreeds());
            expect(result, equals(Left(CacheFailure())));
          },
        );
      },
    );
  });
}
