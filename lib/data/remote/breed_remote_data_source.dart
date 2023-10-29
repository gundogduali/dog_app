import 'package:dog_app/data/model/breed_model.dart';

abstract class BreedRemoteDataSource {
  Future<List<BreedModel>> getBreeds();

  Future<String> getImageByBreed(String breedName);

  Future<List<String>> getImagesBySubBreed(
    String breedName,
    String subBreedName,
  );

  Future<String> getBreedImagesByRandom(String breedName);
}
