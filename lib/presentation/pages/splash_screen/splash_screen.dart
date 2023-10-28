import 'package:auto_route/auto_route.dart';
import 'package:dog_app/foundation/constants/asset_constants.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:dog_app/presentation/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BreedBloc>().add(const BreedEvent.fetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BreedBloc, BreedState>(
      listener: (context, state) {
        print('state: $state');
        state.maybeWhen(
          loaded: (breeds) {
            context.router.replace(const HomeRoute());
          },
          error: (message) {
            context.router.replace(const HomeRoute());
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.splash,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
