import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/shared/components/button_retry.dart';
import 'package:pokedex/shared/components/loading_widget.dart';
import 'package:pokedex/shared/components/type_widget.dart';
import 'package:pokedex/stores/ability_store.dart';
import 'package:pokedex/stores/move_store.dart';
import 'package:pokedex/themes/app_colors.dart';
import 'package:pokedex/util/enums.dart';

class MovesPage extends StatelessWidget {
  final Pokemon pokemon;
  MovesPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  MoveStore _moveStore = MoveStore();
  AbilityStore _abilityStore = AbilityStore();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedCard(
        direction: AnimatedCardDirection.right,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Abilities', size),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: pokemon.abilities!.map((e) {
                return _cardMoveOrAbility(
                    text: e.ability!.name,
                    context: context,
                    url: e.ability!.url,
                    isAbility: true);
              }).toList(),
            ),
            _title('Moves', size),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemon.moves!.map((e) {
                return _cardMoveOrAbility(
                    text: e.move!.name, context: context, url: e.move!.url);
              }).toList(),
            ),
          ],
        ));
  }

  Widget _title(String text, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: size.width,
      child: Text(text),
    );
  }

  Widget _cardMoveOrAbility(
      {String? text,
      BuildContext? context,
      String? url,
      bool isAbility = false}) {
    return GestureDetector(
      onTap: () {
        isAbility
            ? _showInfoAbility(context, url)
            : _showInfoMove(context, url);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    ColorstypePokemon.colorType[pokemon.types![0].type!.name] ??
                        Colors.white,
                width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style: TextStyle(fontSize: 10),
            ),
            Icon(Icons.search)
          ],
        ),
      ),
    );
  }

  Widget _infoMovie(String label, int? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value != null ? value.toString() : '-',
          ),
        ],
      ),
    );
  }

  Widget _infoAblity(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 10),
          Text(
            value != null ? value.toString() : '-',
            style: TextStyle(color: Colors.black54, height: 1.5),
          ),
        ],
      ),
    );
  }

  void _showInfoAbility(context, url) {
    _abilityStore.getAbilityDetails(url);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Observer(builder: (_) {
                  switch (_abilityStore.statusRequestAbility) {
                    case StatusRequest.loading:
                      return Center(
                        child: LoadingWidget(),
                      );
                    case StatusRequest.error:
                      return ButtonRetry(onTap: () {});
                    case StatusRequest.success:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${_abilityStore.abilityDetails!.name}"),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 1,
                            color: ColorstypePokemon
                                .colorType[pokemon.types!.first.type!.name],
                          ),
                          _infoAblity(
                              'effect',
                              _abilityStore
                                  .abilityDetails!.effectEntries!.last.effect),
                          _infoAblity(
                              'short effect',
                              _abilityStore.abilityDetails!.effectEntries!.last
                                  .shortEffect),
                        ],
                      );
                    default:
                      return Container();
                  }
                })),
          );
        });
  }

  void _showInfoMove(context, url) {
    _moveStore.getMovie(url);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.all(15),
              child: Observer(builder: (_) {
                switch (_moveStore.statusRequestMove) {
                  case StatusRequest.loading:
                    return Center(
                      child: LoadingWidget(),
                    );
                  case StatusRequest.error:
                    return ButtonRetry(onTap: () {});
                  case StatusRequest.success:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${_moveStore.moveDetails!.name}"),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 1,
                          color: ColorstypePokemon
                              .colorType[pokemon.types!.first.type!.name],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('type'),
                              TypeWidget(
                                  nameType: _moveStore.moveDetails!.type!.name)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Damage"),
                              Text(
                                _moveStore.moveDetails!.damageClass!.name ??
                                    '-',
                              ),
                            ],
                          ),
                        ),
                        _infoMovie(
                            "Accuracy", _moveStore.moveDetails!.accuracy),
                        _infoMovie("Power", _moveStore.moveDetails!.power),
                        _infoMovie("PP", _moveStore.moveDetails!.pp),
                        _infoMovie(
                            "Priority", _moveStore.moveDetails!.priority),
                        _infoMovie(
                            "Accuracy", _moveStore.moveDetails!.accuracy),
                      ],
                    );
                  default:
                    return Container();
                }
              }));
        });
  }
}
