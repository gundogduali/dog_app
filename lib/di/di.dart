import 'package:dog_app/presentation/route/app_router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(AppRouter());
}
