import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/data/model/breed_model.dart';

abstract class BreedRepository {
  Future<Either<Failure,List<BreedModel>>> getBreeds();

  Future<Either<Failure,List<String>>> getImagesByBreed(String breedName);

  Future<Either<Failure,List<String>>> getImagesBySubBreed(
    String breedName,
    String subBreedName,
  );

  Future<Either<Failure,List<String>>> getBreedImagesByRandom(String breedName);
}
