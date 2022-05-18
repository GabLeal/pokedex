import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/util/base_url.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImp implements PokemonRepository {
  final Dio dio;
  int _offset = 0;

  PokemonRepositoryImp({
    required this.dio,
  });

  @override
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

  @override
  Future<Either<Failure, PokemonEntity>> searchPokemonByName(
      String name) async {
    try {
      var response = await dio.get('${BaseUrl.url}/pokemon/$name');
      var pokemonResponse = response.data;

      PokemonEntity pokemon = PokemonDto.fromJson(pokemonResponse);
      return Right(pokemon);
    } catch (_) {
      return Left(PokemonNotFoundFailure());
    }
  }

  Future<PokemonEntity?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await dio.get(urlPokemon);

      var pokemonResponse = response.data;

      PokemonEntity pokemon = PokemonDto.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }
}
