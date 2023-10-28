import 'package:dio/dio.dart';
import 'package:dog_app/core/network/network_info.dart';
import 'package:dog_app/data/core/app_cache_manager.dart';
import 'package:dog_app/data/core/app_dio.dart';
import 'package:dog_app/data/core/app_shared_prefs.dart';
import 'package:dog_app/data/local/breed_local_data_source.dart';
import 'package:dog_app/data/local/breed_local_data_source_impl.dart';
import 'package:dog_app/data/remote/breed_remote_data_source.dart';
import 'package:dog_app/data/remote/breed_remote_data_source_impl.dart';
import 'package:dog_app/data/repositories/breed_repository_impl.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/usecases/get_breeds_usecase.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:dog_app/presentation/route/app_router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton(AppRouter())
    ..registerSingleton<NetworkInfo>(NetworkInfoImpl())
    //Data Core Layer
    ..registerSingleton<Dio>(AppDio())
    ..registerSingleton<AppShared>(AppShared())
    ..registerSingleton<AppCacheManager>(AppCacheManagerImpl())
    //DataSources
    ..registerSingleton<BreedRemoteDataSource>(
      BreedRemoteDataSourceImpl(getIt()),
    )
    ..registerSingleton<BreedLocalDataSource>(
      BreedLocalDataSourceImpl(getIt()),
    )
    //Repositories
    ..registerSingleton<BreedRepository>(
      BreedRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
        networkInfo: getIt(),
        cacheManager: getIt(),
      ),
    )
    //UseCases
    ..registerSingleton<GetBreedsUseCase>(
      GetBreedsUseCase(repository: getIt()),
    )
    //Bloc
    ..registerFactory<BreedBloc>(
      () => BreedBloc(getIt()),
    );
}
