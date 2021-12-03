import 'package:dio/dio.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/util/base_url.dart';

class PokemonRepository {
  final Dio dio;
  int _offset = 0;

  PokemonRepository({
    required this.dio,
  });

  Future<List<PokemonEntity>> getPokemons() async {
    List<PokemonEntity> pokemons = [];
    try {
      var response = await dio
          .get('${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20');

      List listaPokemons = response.data['results'];

      for (int i = 0; i < listaPokemons.length; i++) {
        PokemonEntity? pokemon = await _loadingPokemon(listaPokemons[i]['url']);

        if (pokemon != null) pokemons.add(pokemon);
      }

      _offset += 20;

      return pokemons;
    } catch (erro) {
      return pokemons;
    }
  }

  Future<PokemonEntity?> searchPokemonByName(String name) async {
    try {
      var response = await dio.get('${BaseUrl.url}/pokemon/$name');

      var pokemonResponse = response.data;

      PokemonEntity pokemon = PokemonEntity.fromJson(pokemonResponse);
      return pokemon;
    } catch (erro) {
      return null;
    }
  }

  Future<PokemonEntity?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await dio.get(urlPokemon);

      var pokemonResponse = response.data;

      PokemonEntity pokemon = PokemonEntity.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }
}
