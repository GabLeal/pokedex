import 'package:flutter/material.dart';
import 'package:pokedex/pages/home/home_page.dart';
import 'package:pokedex/util/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut);

    _controller!.forward();
  }

  @override
  dispose() {
    _controller!.dispose();
    super.dispose();
  }

  _navigatorToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _navigatorToHome(),
        builder: (contex, snap) {
          return Container(
            color: Color(0xFFFF0000),
            child: Center(
              child: ScaleTransition(
                scale: _animation!,
                alignment: Alignment.center,
                child: Image.asset(AppImages.pokedex),
              ),
            ),
          );
        });
  }
}
