import 'package:dog_app/data/model/breed_model.dart';

abstract class BreedRemoteDataSource {
  Future<List<BreedModel>> getBreeds();

  Future<List<String>> getImagesByBreed(String breedName);

  Future<List<String>> getImagesBySubBreed(
    String breedName,
    String subBreedName,
  );

  Future<List<String>> getBreedImagesByRandom(String breedName);
}
