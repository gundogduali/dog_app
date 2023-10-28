import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/core/network/network_info.dart';
import 'package:dog_app/core/utils/data_wrappers.dart';
import 'package:dog_app/data/local/breed_local_data_source.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/data/remote/breed_remote_data_source.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';

class BreedRepositoryImpl implements BreedRepository {
  BreedRepositoryImpl({
    required BreedRemoteDataSource remoteDataSource,
    required BreedLocalDataSource localDataSource,
    required this.networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final BreedRemoteDataSource _remoteDataSource;
  final BreedLocalDataSource _localDataSource;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, List<String>>> getBreedImagesByRandom(
    String breedName,
  ) {
    return DataWrappers<List<String>>().tryCatchWrapper(
      networkInfo,
      () => _remoteDataSource.getBreedImagesByRandom(breedName),
    );
  }

  @override
  Future<Either<Failure, List<BreedModel>>> getBreeds() {
    return DataWrappers<List<BreedModel>>().localFirstTryCatchWrapper(
      networkInfo,
      () async {
        final breeds = await _remoteDataSource.getBreeds();
        unawaited(_localDataSource.cacheBreeds(breeds));
        return breeds;
      },
      cacheFunction: _localDataSource.getBreeds,
    );
  }

  @override
  Future<Either<Failure, List<String>>> getImagesByBreed(String breedName) {
    return DataWrappers<List<String>>().tryCatchWrapper(
      networkInfo,
      () => _remoteDataSource.getImagesByBreed(breedName),
    );
  }

  @override
  Future<Either<Failure, List<String>>> getImagesBySubBreed(
    String breedName,
    String subBreedName,
  ) {
    return DataWrappers<List<String>>().tryCatchWrapper(
      networkInfo,
      () => _remoteDataSource.getImagesBySubBreed(breedName, subBreedName),
    );
  }
}
