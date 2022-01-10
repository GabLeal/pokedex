import 'package:flutter/material.dart';

class ButtonRetry extends StatelessWidget {
  final Function() onTap;
  const ButtonRetry({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Não estamos conseguindo conectar com a internet no momento.",
          textAlign: TextAlign.center,
          style: TextStyle(height: 1.5),
        ),
        Container(
            child: ElevatedButton(
          child: Text("Tentar novamente"),
          onPressed: onTap,
        ))
      ],
    );
  }
}
