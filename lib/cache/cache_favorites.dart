import 'dart:convert';
import 'package:pokedex/layers/data/dto/pokemon_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheFavorites {
  Future<List<PokemonDto>> getFavoritesPokemons() async {
    List<PokemonDto>? favoritesPokemons = [];

    final instance = await SharedPreferences.getInstance();
    instance.getKeys().forEach((keyNamePokemon) {
      final json = jsonDecode(instance.getString(keyNamePokemon)!);
      PokemonDto pokemon = PokemonDto.fromJson(json);
      favoritesPokemons.add(pokemon);
    });

    return favoritesPokemons;
  }

  Future<bool> favoritePokemon(PokemonDto pokemon) async {
    final instance = await SharedPreferences.getInstance();

    return instance.setString('${pokemon.name}', jsonEncode(pokemon.toJson()));
  }

  Future<bool> removeFavoritePokemon(PokemonDto pokemon) async {
    final instance = await SharedPreferences.getInstance();
    return await instance.remove(pokemon.name!);
  }
}
