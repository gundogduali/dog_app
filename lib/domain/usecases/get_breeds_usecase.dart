import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/core/usecases/usecase.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';

class GetBreedsUseCase extends UseCase<List<BreedModel>, NoParams> {
  GetBreedsUseCase({required BreedRepository repository})
      : _repository = repository;

  final BreedRepository _repository;

  @override
  Future<Either<Failure, List<BreedModel>>> call(NoParams params) {
    return _repository.getBreeds();
  }
}
