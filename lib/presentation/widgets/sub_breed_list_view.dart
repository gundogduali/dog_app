import 'package:dog_app/data/model/sub_breed_model.dart';
import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/components/dialog_list_text.dart';
import 'package:flutter/material.dart';

class SubBreedListView extends StatelessWidget {
  const SubBreedListView({required this.subBreeds, super.key});
  final List<SubBreedModel> subBreeds;

  @override
  Widget build(BuildContext context) {
    if (subBreeds.isEmpty) {
      return DialogListText(text: LocaleKeys.noSubBreed.translate);
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: subBreeds.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.k4),
          child: DialogListText(
            text: subBreeds[index].name.capitalizeFirstLetter,
          ),
        );
      },
    );
  }
}
