import 'package:auto_route/auto_route.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:dog_app/presentation/components/app_empty_widget.dart';
import 'package:dog_app/presentation/components/app_error_widget.dart';
import 'package:dog_app/presentation/components/app_sheet_textfield.dart';
import 'package:dog_app/presentation/components/grid_view_loading.dart';
import 'package:dog_app/presentation/mixins/breed_detail_mixin.dart';
import 'package:dog_app/presentation/widgets/breed_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BreedDetailMixin {
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
          return Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: state.maybeWhen<Widget>(
                    loaded: (breeds) => BreedGridView(
                      breeds: breeds,
                      onTapListItem: showBreedDetailDialog,
                    ),
                    error: (message) => AppErrorWidget(
                      errorMessage: message,
                      onRetry: () {
                        context.read<BreedBloc>().add(const BreedEvent.fetch());
                      },
                    ),
                    empty: () => const AppEmptyWidget(),
                    orElse: GridViewLoading.new,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: state.maybeWhen(
                    loaded: (breeds) => AppSheetTextField(
                      onChanged: (value) => context
                          .read<BreedBloc>()
                          .add(BreedEvent.search(value)),
                    ),
                    empty: () => AppSheetTextField(
                      onChanged: (value) => context
                          .read<BreedBloc>()
                          .add(BreedEvent.search(value)),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
