import 'dart:convert';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheFavorites {
  Future<List<PokemonEntity>> getFavoritesPokemons() async {
    List<PokemonEntity>? favoritesPokemons = [];

    final instance = await SharedPreferences.getInstance();
    instance.getKeys().forEach((keyNamePokemon) {
      final json = jsonDecode(instance.getString(keyNamePokemon)!);
      PokemonEntity pokemon = PokemonEntity.fromJson(json);
      favoritesPokemons.add(pokemon);
    });

    return favoritesPokemons;
  }

  Future<bool> favoritePokemon(PokemonEntity pokemon) async {
    final instance = await SharedPreferences.getInstance();

    return instance.setString('${pokemon.name}', jsonEncode(pokemon.toJson()));
  }

  Future<bool> removeFavoritePokemon(PokemonEntity pokemon) async {
    final instance = await SharedPreferences.getInstance();
    return await instance.remove(pokemon.name!);
  }
}
