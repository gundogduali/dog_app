import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/core/usecases/usecase.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:equatable/equatable.dart';

class GetRandomBreedImageUseCase
    extends UseCase<String, GetRandomBreedImageParams> {
  GetRandomBreedImageUseCase({required BreedRepository repository})
      : _repository = repository;

  final BreedRepository _repository;

  @override
  Future<Either<Failure, String>> call(GetRandomBreedImageParams params) {
    return _repository.getBreedImagesByRandom(params.breedName);
  }
}

class GetRandomBreedImageParams extends Equatable {
  const GetRandomBreedImageParams({required this.breedName});
  final String breedName;

  @override
  List<Object?> get props => [breedName];
}
