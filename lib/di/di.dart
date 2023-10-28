import 'package:dio/dio.dart';
import 'package:dog_app/data/core/app_dio.dart';
import 'package:dog_app/data/remote/breed_remote_data_source.dart';
import 'package:dog_app/data/remote/breed_remote_data_source_impl.dart';
import 'package:dog_app/presentation/route/app_router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton(AppRouter())
    ..registerSingleton<Dio>(AppDio())
    ..registerSingleton<BreedRemoteDataSource>(
      BreedRemoteDataSourceImpl(dio: getIt()),
    );
}
