import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/model/type_damage.dart';
import 'package:pokedex/shared/components/button_retry.dart';
import 'package:pokedex/shared/components/loading.dart';
import 'package:pokedex/shared/components/type_widget.dart';
import 'package:pokedex/stores/type_damage_store.dart';
import 'package:pokedex/util/enums.dart';

class DamagePage extends StatefulWidget {
  final Pokemon pokemon;
  DamagePage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _DamagePageState createState() => _DamagePageState();
}

class _DamagePageState extends State<DamagePage> {
  TypeDamageStore _typeDamageStore = TypeDamageStore();
  @override
  void initState() {
    _typeDamageStore.getTypeDamage(widget.pokemon.types!.first.type!.url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (_typeDamageStore.statusRequestTypedamage) {
        case StatusRequest.loading:
          return Center(
            child: Loading(),
          );
        case StatusRequest.error:
          return Column(
            children: [
              Text(
                  "Não estamos conseguindo conectar com a internet no momento."),
              ButtonRetry(
                onTap: () {
                  _typeDamageStore
                      .getTypeDamage(widget.pokemon.types!.first.type!.url);
                },
              )
            ],
          );
        case StatusRequest.success:
          var damageRelations = _typeDamageStore.typeDamage!.damageRelations;
          return AnimatedCard(
              direction: AnimatedCardDirection.right,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _damageItem(
                        'Double Damage To', damageRelations!.doubleDamageTo!),
                    _damageItem('Double Damage From',
                        damageRelations.doubleDamageFrom!),
                    _damageItem(
                        'Half Damage To', damageRelations.halfDamageTo!),
                    _damageItem(
                        'Half Damage From', damageRelations.halfDamageFrom!),
                  ]));
        default:
          return Container();
      }
    });
  }

  Widget _damageItem(String title, List<Damage> damages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Wrap(
            runSpacing: 5,
            direction: Axis.horizontal,
            children: damages.map((damage) {
              return TypeWidget(nameType: damage.name);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
