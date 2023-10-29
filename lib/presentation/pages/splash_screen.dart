import 'package:auto_route/auto_route.dart';
import 'package:dog_app/foundation/constants/asset_constants.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final Tween<double> scale = Tween<double>(begin: 1, end: 1.5);
  final Tween<double> rotate = Tween<double>(begin: 0, end: 2 * 3.14);
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BreedBloc>().add(const BreedEvent.fetch());
      _animationController
        ..forward()
        ..addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          },
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BreedBloc, BreedState>(
      listener: (context, state) {
        // state.maybeWhen(
        //   loaded: (breeds) {
        //     context.router.replace(const HomeRoute());
        //   },
        //   error: (message) {
        //     context.router.replace(const HomeRoute());
        //   },
        //   orElse: () {},
        // );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: scale.evaluate(_animationController),
                    child: Transform.rotate(
                      angle: rotate.evaluate(_animationController),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  Assets.logo,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
