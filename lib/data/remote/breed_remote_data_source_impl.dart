import 'package:dio/dio.dart';
import 'package:dog_app/data/core/api_constants.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/data/remote/breed_remote_data_source.dart';

class BreedRemoteDataSourceImpl implements BreedRemoteDataSource {
  BreedRemoteDataSourceImpl(this.dio);

  final Dio dio;
  @override
  Future<List<BreedModel>> getBreeds() async {
    final response = await dio.get<Map<String, dynamic>>(ApiConstants.breeds);
    final breedsMap = response.data?['message'] as Map<String, dynamic>;
    final breeds = <BreedModel>[];
    for (final entry in breedsMap.entries) {
      final breed = BreedModel.fromMap({
        entry.key: entry.value,
      });
      final images = await getImagesByBreed(breed.name);
      breeds.add(breed.copyWith(images: images));
    }
    return breeds;
  }

  @override
  Future<List<String>> getImagesByBreed(String breedName) async {
    final response = await dio.get<Map<String, dynamic>>(
      ApiConstants.images(breedName),
    );
    final images =
        List<String>.from(response.data?['message'] as List<dynamic>);
    return images;
  }

  @override
  Future<List<String>> getImagesBySubBreed(
    String breedName,
    String subBreedName,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      ApiConstants.subImages(breedName, subBreedName),
    );
    final images =
        List<String>.from(response.data?['message'] as List<dynamic>);
    return images;
  }

  @override
  Future<List<String>> getBreedImagesByRandom(String breedName) async {
    final response = await dio.get<Map<String, dynamic>>(
      ApiConstants.randomBreedImages(breedName),
    );
    final images =
        List<String>.from(response.data?['message'] as List<dynamic>);
    return images;
  }
}
