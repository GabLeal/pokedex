import 'package:pokedex/layers/domain/entities/effect_entries_entity.dart';

class AbilityDetailsEntity {
  List<EffectEntriesEntity>? effectEntries;
  String? name;

  AbilityDetailsEntity({this.effectEntries, this.name});
}
