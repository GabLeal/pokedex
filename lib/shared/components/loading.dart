import 'package:flutter/material.dart';
import 'package:pokedex/util/app_images.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  AnimationController? _controller;

  double target = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controller!.forward();
    _controller!.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller!),
        child: Container(
          height: 50,
          child: Image.asset(AppImages.poke),
        ));
  }
}
