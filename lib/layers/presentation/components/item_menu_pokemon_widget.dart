import 'package:flutter/material.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/info_pokemon_page.dart';

class ItemMenuPokemonWidget extends StatefulWidget {
  final String label;
  final Info info;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final Function() onTap;

  const ItemMenuPokemonWidget({
    Key? key,
    required this.label,
    required this.info,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  _ItemMenuPokemonWidgetState createState() => _ItemMenuPokemonWidgetState();
}

class _ItemMenuPokemonWidgetState extends State<ItemMenuPokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(color: widget.borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 13,
            color: widget.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
