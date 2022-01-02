import 'package:animated_card/animated_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/data/repositories/type_damage_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case_imp.dart';
import 'package:pokedex/layers/presentation/components/button_retry.dart';
import 'package:pokedex/layers/presentation/components/loading_widget.dart';
import 'package:pokedex/layers/presentation/components/type_widget.dart';
import 'package:pokedex/layers/presentation/stores/type_damage_store.dart';
import 'package:pokedex/util/enums.dart';

class DamagePage extends StatefulWidget {
  final PokemonEntity pokemon;
  DamagePage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _DamagePageState createState() => _DamagePageState();
}

class _DamagePageState extends State<DamagePage> {
  TypeDamageStore _typeDamageStore = TypeDamageStore(
    TypeDamageUseCaseImp(
      TypeDamageRepositoryImp(
        dio: Dio(),
      ),
    ),
  );
  @override
  void initState() {
    _typeDamageStore.getTypeDamage(widget.pokemon.types!.first.type!.url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Observer(builder: (_) {
      switch (_typeDamageStore.statusRequestTypedamage) {
        case StatusRequest.loading:
          return Container(
            height: size.height / 2.5,
            child: Center(
              child: LoadingWidget(),
            ),
          );
        case StatusRequest.error:
          return Container(
            height: size.height / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ),
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
                    if (damageRelations!.doubleDamageTo!.isNotEmpty)
                      _damageItem(
                          'Double Damage To', damageRelations.doubleDamageTo!),
                    if (damageRelations.doubleDamageFrom!.isNotEmpty)
                      _damageItem('Double Damage From',
                          damageRelations.doubleDamageFrom!),
                    if (damageRelations.halfDamageTo!.isNotEmpty)
                      _damageItem(
                          'Half Damage To', damageRelations.halfDamageTo!),
                    if (damageRelations.halfDamageFrom!.isNotEmpty)
                      _damageItem(
                          'Half Damage From', damageRelations.halfDamageFrom!),
                  ]));
        default:
          return Container();
      }
    });
  }

  Widget _damageItem(String title, List<Damage> damages) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
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
      ),
    );
  }
}
