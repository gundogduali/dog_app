import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/presentation/components/cached_image_widget.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    required this.name,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            name.capitalizeFirstLetter,
            textAlign: TextAlign.start,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        child: CachedImageWidget(imageUrl: imageUrl),
      ),
    );
  }
}
