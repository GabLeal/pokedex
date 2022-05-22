import 'package:flutter/material.dart';

class PokeballHomeTransition extends StatefulWidget {
  const PokeballHomeTransition({Key? key}) : super(key: key);

  @override
  _PokeballHomeTransitionState createState() => _PokeballHomeTransitionState();
}

class _PokeballHomeTransitionState extends State<PokeballHomeTransition> {
  bool isAnimateHomePokeball = false;
  var duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isAnimateHomePokeball = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        AnimatedPositioned(
          duration: duration,
          top: isAnimateHomePokeball ? -fullHeight / 2 : 0,
          left: 0,
          right: 0,
          height: fullHeight / 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: duration,
          bottom: isAnimateHomePokeball ? -fullHeight : 0,
          left: 0,
          right: 0,
          height: fullHeight / 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 1100),
          top: isAnimateHomePokeball ? -fullHeight - 50 : 1,
          left: 0,
          bottom: isAnimateHomePokeball ? 0 : 1,
          right: 0,
          child: Stack(
            children: [
              Center(
                child: Container(
                  color: Colors.black,
                  height: 15,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 7,
                    ),
                  ),
                  height: 60,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  height: 15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
