import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/util/base_url.dart';

class PokemonRepositoryImp implements PokemonRepository {
  final Dio dio;
  int _offset = 0;

  PokemonRepositoryImp({
    required this.dio,
  });

  @override
  Future<List<PokemonDto>> getPokemons() async {
    List<PokemonDto> pokemons = [];
    try {
      var response = await dio
          .get('${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20');

      List listaPokemons = response.data['results'];

      for (int i = 0; i < listaPokemons.length; i++) {
        PokemonDto? pokemon = await _loadingPokemon(listaPokemons[i]['url']);

        if (pokemon != null) pokemons.add(pokemon);
      }

      _offset += 20;

      return pokemons;
    } catch (erro) {
      return pokemons;
    }
  }

  @override
  Future<PokemonDto?> searchPokemonByName(String name) async {
    try {
      var response = await dio.get('${BaseUrl.url}/pokemon/$name');

      var pokemonResponse = response.data;

      PokemonDto pokemon = PokemonDto.fromJson(pokemonResponse);
      return pokemon;
    } catch (erro) {
      return null;
    }
  }

  Future<PokemonDto?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await dio.get(urlPokemon);

      var pokemonResponse = response.data;

      PokemonDto pokemon = PokemonDto.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }
}
