import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/themes/app_colors.dart';

class StatsPage extends StatefulWidget {
  final Pokemon pokemon;
  const StatsPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  bool updateStats = false;
  void delayStats() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        updateStats = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayStats();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: AnimatedCard(
            direction: AnimatedCardDirection.right,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Height ${widget.pokemon.height}",
                        style: TextStyle(fontSize: 10),
                      ),
                      Container(
                        height: size.height * 0.05,
                        width: 2,
                        color: ColorstypePokemon
                            .colorType[widget.pokemon.types![0].type!.name],
                      ),
                      Text(
                        "Weight ${widget.pokemon.weight}",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedCard(
          direction: AnimatedCardDirection.left,
          initDelay: Duration(milliseconds: 60),
          duration: Duration(seconds: 1),
          curve: Curves.ease,
          child: Container(
            padding: EdgeInsets.all(10),
            width: size.width,
            child: Column(
              children: widget.pokemon.stats!.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${e.stat!.name}".replaceFirst(e.stat!.name![0],
                                e.stat!.name![0].toUpperCase()),
                            style: TextStyle(fontSize: 10),
                          ),
                          Text("${e.baseStat}", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 5,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                                height: 5,
                                width: updateStats
                                    ? size.width *
                                        (e.baseStat!.toDouble() / 100)
                                    : 0,
                                decoration: BoxDecoration(
                                    color: ColorstypePokemon.colorType[
                                        widget.pokemon.types![0].type!.name],
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
