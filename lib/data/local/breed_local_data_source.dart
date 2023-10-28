import 'package:dog_app/data/model/breed_model.dart';

abstract class BreedLocalDataSource {
  Future<List<BreedModel>> getBreeds();
  Future<void> cacheBreeds(List<BreedModel> breeds);
}
