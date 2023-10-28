import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/foundation/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    required this.imageUrl,
    this.borderRadius = 8,
    super.key,
  });

  final String imageUrl;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (context, url, error) {
        return Image.asset(
          Assets.noImage,
          fit: BoxFit.contain,
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
          ),
        );
      },
      fadeInDuration: const Duration(milliseconds: 250),
      fadeOutDuration: const Duration(milliseconds: 250),
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
