import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/di/di.dart';
import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/bloc/breed_detail/breed_detail_bloc.dart';
import 'package:dog_app/presentation/components/cached_image_widget.dart';
import 'package:dog_app/presentation/components/circular_back_button.dart';
import 'package:dog_app/presentation/components/dialog_list_text.dart';
import 'package:dog_app/presentation/components/dialog_title_widget.dart';
import 'package:dog_app/presentation/components/shimmer_widget.dart';
import 'package:dog_app/presentation/route/route_paths.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:dog_app/presentation/widgets/sub_breed_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedDetailDialogWidget extends StatefulWidget {
  const BreedDetailDialogWidget({required this.breed, super.key});
  final BreedModel breed;

  static Future<void> show(
    BuildContext context, {
    required BreedModel breed,
  }) async {
    await showDialog<void>(
      context: context,
      barrierColor: AppColors.black.withOpacity(.4),
      routeSettings: const RouteSettings(name: RoutePaths.breedDetailDialog),
      builder: (_) => BreedDetailDialogWidget(breed: breed),
    );
  }

  @override
  State<BreedDetailDialogWidget> createState() =>
      _BreedDetailDialogWidgetState();
}

class _BreedDetailDialogWidgetState extends State<BreedDetailDialogWidget> {
  late final BreedDetailBloc _breedDetailBloc;
  @override
  void initState() {
    super.initState();
    _breedDetailBloc = getIt<BreedDetailBloc>(param1: widget.breed);
  }

  @override
  void dispose() {
    _breedDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: context.width,
        margin: const EdgeInsets.symmetric(
          horizontal: Sizes.k16,
          vertical: Sizes.k90,
        ),
        padding: const EdgeInsets.only(bottom: Sizes.k16),
        decoration: BoxDecoration(
          color: AppColors.systemBackgroundLight,
          borderRadius: BorderRadius.circular(Sizes.k16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  BlocBuilder<BreedDetailBloc, BreedDetailState>(
                    bloc: _breedDetailBloc,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const ShimmerWidget(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(Sizes.k16),
                          ),
                        );
                      }
                      return CachedImageWidget(
                        imageUrl: state.imageUrl,
                        width: context.width,
                        height: context.width,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(Sizes.k16),
                        ),
                      );
                    },
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: CircularBackButton(
                      padding: EdgeInsets.all(Sizes.k12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Sizes.k12),
            DialogTitleWidget(
              title: LocaleKeys.breed.translate,
            ),
            DialogListText(text: widget.breed.name.capitalizeFirstLetter),
            const SizedBox(height: Sizes.k12),
            DialogTitleWidget(
              title: LocaleKeys.subBreed.translate,
            ),
            SubBreedListView(subBreeds: widget.breed.subBreeds),
            const SizedBox(height: Sizes.k32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.k16),
              child: ElevatedButton(
                onPressed: () {
                  _breedDetailBloc.add(const BreedDetailEvent.generate());
                },
                child: Text(
                  LocaleKeys.generate.translate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
