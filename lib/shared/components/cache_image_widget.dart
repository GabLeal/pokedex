import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/themes/app_images.dart';

class CacheImageWidget extends StatelessWidget {
  final String pathImage;
  const CacheImageWidget({
    Key? key,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: pathImage,
      placeholder: (context, url) => Image.asset(
        AppImages.pokeballLoading,
        width: 30,
        height: 30,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
