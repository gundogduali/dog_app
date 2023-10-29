import 'dart:convert';

import 'package:dog_app/data/core/app_shared_prefs.dart';
import 'package:dog_app/data/core/prefs_constants.dart';
import 'package:dog_app/data/local/breed_local_data_source.dart';
import 'package:dog_app/data/local/breed_local_data_source_impl.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'breed_local_data_source_test.mocks.dart';

@GenerateMocks([AppShared])
void main() {
  late final AppShared mockShared;
  late final BreedLocalDataSource localDataSource;

  setUp(
    () {
      mockShared = MockAppShared();
      localDataSource = BreedLocalDataSourceImpl(mockShared);
    },
  );

  test(
    'get breeds from cache',
    () async {
      final breedMaps = List<Map<String, dynamic>>.from(
        json.decode(fixture('breeds_local.json')) as List<dynamic>,
      );
      final tBreedsModel = breedMaps.map(BreedModel.fromMapWithImages).toList();

      when(mockShared.getCacheStringList(key: PrefsConstants.breed))
          .thenReturn(breedMaps.map((e) => json.encode(e)).toList());

      final result = await localDataSource.getBreeds();

      expect(result, equals(tBreedsModel));
    },
  );
}
