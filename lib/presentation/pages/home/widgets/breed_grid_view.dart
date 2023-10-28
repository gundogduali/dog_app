import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/presentation/components/grid_card.dart';
import 'package:flutter/material.dart';

class BreedGridView extends StatelessWidget {
  const BreedGridView({required this.breeds, super.key});
  final List<BreedModel> breeds;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        final breed = breeds[index];
        return GridCard(
          name: breed.name,
          imageUrl: breed.images.first,
          onTap: () {
            //TODO: Navigate to breed detail screen
          },
        );
      },
    );
  }
}
