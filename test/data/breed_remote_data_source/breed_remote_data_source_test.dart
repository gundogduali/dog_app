// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dog_app/core/exceptions/exceptions.dart';
import 'package:dog_app/data/core/api_constants.dart';
import 'package:dog_app/data/core/app_dio.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/data/remote/breed_remote_data_source.dart';
import 'package:dog_app/data/remote/breed_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'breed_remote_data_source_test.mocks.dart';

@GenerateMocks([AppDio])
void main() {
  late BreedRemoteDataSource remoteDataSource;
  late MockAppDio mockAppDio;

  setUp(() {
    mockAppDio = MockAppDio();
    remoteDataSource = BreedRemoteDataSourceImpl(mockAppDio);
  });

  void setUpMockClientSuccess200() {
    when(
      mockAppDio.get<Map<String, dynamic>>(
        ApiConstants.breeds,
      ),
    ).thenAnswer(
      (_) async => Response(
        data: jsonDecode(fixture('breeds_list.json')) as Map<String, dynamic>,
        statusCode: 200,
        requestOptions: RequestOptions(),
      ),
    );
    when(
      mockAppDio.get<Map<String, dynamic>>(
        argThat(contains('images/random/1')),
      ),
    ).thenAnswer(
      (_) async => Response(
        data: jsonDecode(fixture('breed_random_image.json'))
            as Map<String, dynamic>,
        statusCode: 200,
        requestOptions: RequestOptions(),
      ),
    );
  }

  void setUpMockClientFailure404() {
    when(
      mockAppDio.get<Map<String, dynamic>>(ApiConstants.breeds),
    ).thenAnswer(
      (_) => Future.value(
        Response(
          data: {
            'message': 'Not Found',
            'status': 'error',
          },
          statusCode: 404,
          requestOptions: RequestOptions(),
        ),
      ),
    );
  }

  group('Breed Remote Data Source', () {
    final breedMaps = List<Map<String, dynamic>>.from(
      json.decode(fixture('breeds_remote.json')) as List<dynamic>,
    );
    final tBreedsModel = breedMaps.map(BreedModel.fromMapWithImages).toList();
    test(
      'should return Breeds when the response code is 200 (success)',
      () async {
        setUpMockClientSuccess200();
        final result = await remoteDataSource.getBreeds();
        expect(result, equals(tBreedsModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpMockClientFailure404();
        final call = remoteDataSource.getBreeds;
        expect(call, throwsA(isA<ServerException>()));
      },
    );
  });
}
