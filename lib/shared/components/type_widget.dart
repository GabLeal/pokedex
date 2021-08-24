import 'package:flutter/material.dart';
import 'package:pokedex/themes/app_colors.dart';

class TypeWidget extends StatelessWidget {
  String? nameType;
  TypeWidget({
    Key? key,
    required this.nameType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        borderRadius: BorderRadius.circular(7),
        elevation: 3,
        child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
                color: ColorstypePokemon.colorType[nameType] ?? Colors.black,
                borderRadius: BorderRadius.circular(7)),
            child: Text(
              nameType!.replaceFirst(nameType![0], nameType![0].toUpperCase()),
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
