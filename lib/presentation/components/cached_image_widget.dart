import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/foundation/constants/asset_constants.dart';
import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/presentation/components/shimmer_widget.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    required this.imageUrl,
    this.borderRadius,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String imageUrl;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final BoxFit fit;

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
        return ShimmerWidget(
          borderRadius: borderRadius ?? BorderRadius.circular(Sizes.k8),
        );
      },
      fadeInDuration: const Duration(milliseconds: 250),
      fadeOutDuration: const Duration(milliseconds: 250),
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(Sizes.k8),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
    );
  }
}
