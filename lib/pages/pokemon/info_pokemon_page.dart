import 'package:animated_card/animated_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/util/app_colors.dart';

class InfoPokemonPage extends StatefulWidget {
  final Pokemon pokemon;

  const InfoPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _InfoPokemonPageState createState() => _InfoPokemonPageState();
}

class _InfoPokemonPageState extends State<InfoPokemonPage> {
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
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor:
              ColorstypePokemon.colorType[widget.pokemon.types![0].type!.name],
          pinned: true,
          floating: true,
          snap: true,
          centerTitle: true,
          title: Text(
            "${widget.pokemon.name}",
          ),
          expandedHeight: 220.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Center(
            child: Stack(
              children: [
                Center(
                  child: Hero(
                    tag: widget.pokemon.order ?? 'dash',
                    child: CachedNetworkImage(
                      imageUrl: "${widget.pokemon.sprites!.frontDefault}",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.pokemon.types!.map((t) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Material(
                            borderRadius: BorderRadius.circular(7),
                            elevation: 3,
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 0.5),
                                    color: ColorstypePokemon
                                        .colorType[t.type!.name],
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  "${t.type!.name}",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: _pesoAltura(size),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _infoBasicas(size),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: _moves(),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: _localization(),
          )
        ]))
      ],
    ));
  }

  Widget _infoBasicas(Size size) {
    return AnimatedCard(
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
                        "${e.stat!.name}",
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 3,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn,
                            height: 3,
                            width: updateStats
                                ? size.width * (e.baseStat!.toDouble() / 100)
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
    );
  }

  Widget _localization() {
    return Column(children: [Text("${widget.pokemon.locationAreaEncounters}")]);
  }

  Widget _moves() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.pokemon.abilities!.map((e) {
            return Text(
              '${e.ability!.name}',
              style: TextStyle(fontSize: 10),
            );
          }).toList(),
        ),
        Text('_______________________'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.pokemon.moves!.map((e) {
            return Text(
              '${e.move!.name}',
              style: TextStyle(fontSize: 10),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _pesoAltura(Size size) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Altura ${widget.pokemon.height}",
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  height: size.height * 0.05,
                  width: 1,
                  color: ColorstypePokemon
                      .colorType[widget.pokemon.types![0].type!.name],
                ),
                Text(
                  "Peso ${widget.pokemon.weight}",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
