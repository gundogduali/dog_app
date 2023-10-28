import 'package:auto_route/auto_route.dart';
import 'package:dog_app/di/di.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/foundation/constants/asset_constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final breedList = await getIt<BreedRepository>().getBreeds();
              },
              child: const Text('breeds'),
            ),
            Image.asset(
              Assets.splash,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
