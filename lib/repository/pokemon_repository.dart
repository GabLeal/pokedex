import 'package:dio/dio.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/util/base_url.dart';

class PokemonRepository {
  final Dio dio;
  int _offset = 0;

  PokemonRepository({
    required this.dio,
  });

  Future<List<Pokemon>> getPokemons() async {
    List<Pokemon> pokemons = [];
    try {
      var response = await dio
          .get('${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20');

      List listaPokemons = response.data['results'];

      for (int i = 0; i < listaPokemons.length; i++) {
        Pokemon? pokemon = await _loadingPokemon(listaPokemons[i]['url']);

        if (pokemon != null) pokemons.add(pokemon);
      }

      _offset += 20;

      return pokemons;
    } catch (erro) {
      return pokemons;
    }
  }

  Future<Pokemon?> searchPokemonByName(String name) async {
    try {
      var response = await dio.get('${BaseUrl.url}/pokemon/$name');

      var pokemonResponse = response.data;

      Pokemon pokemon = Pokemon.fromJson(pokemonResponse);
      return pokemon;
    } catch (erro) {
      return null;
    }
  }

  Future<Pokemon?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await dio.get(urlPokemon);

      var pokemonResponse = response.data;

      Pokemon pokemon = Pokemon.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }
}
