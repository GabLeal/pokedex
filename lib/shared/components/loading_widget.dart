import 'package:flutter/material.dart';
import 'package:pokedex/util/app_images.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.pokeballLoading,
        width: 100,
        height: 100,
      ),
    );
  }
}
