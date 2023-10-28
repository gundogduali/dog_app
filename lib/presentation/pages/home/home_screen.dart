import 'package:auto_route/auto_route.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:dog_app/presentation/components/app_error_widget.dart';
import 'package:dog_app/presentation/components/grid_view_loading.dart';
import 'package:dog_app/presentation/pages/home/widgets/breed_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.translate,
        ),
      ),
      body: BlocBuilder<BreedBloc, BreedState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (breeds) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BreedGridView(breeds: breeds),
            ),
            error: (message) => AppErrorWidget(
              errorMessage: message,
              onRetry: () {
                context.read<BreedBloc>().add(const BreedEvent.fetch());
              },
            ),
            orElse: GridViewLoading.new,
          );
        },
      ),
    );
  }
}
