// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dog_app/data/core/app_shared_prefs.dart';
import 'package:dog_app/data/core/prefs_constants.dart';
import 'package:dog_app/data/local/breed_local_data_source.dart';
import 'package:dog_app/data/model/breed_model.dart';

class BreedLocalDataSourceImpl implements BreedLocalDataSource {
  AppShared prefs;
  BreedLocalDataSourceImpl(this.prefs);
  @override
  Future<void> cacheBreeds(List<BreedModel> breeds,Duration cacheDuration) {
    final value = breeds.map((e) => e.toJson()).toList();

    return prefs.cacheStringList(
      key: PrefsConstants.breed,
      value: value,
      duration: cacheDuration,
    );
  }

  @override
  Future<List<BreedModel>> getBreeds() {
    final value = prefs.getCacheStringList(key: PrefsConstants.breed);
    return Future.value(
      value.map(BreedModel.fromJson).toList(),
    );
  }
}
