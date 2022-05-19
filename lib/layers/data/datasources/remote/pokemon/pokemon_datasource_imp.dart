import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/util/base_url.dart';
import 'package:pokedex/layers/data/datasources/remote/pokemon/pokemon_datasource.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

class PokemonDatasourceImp implements PokemonDatasource{
  int _offset = 0;
  final Dio _dio;
  PokemonDatasourceImp(this._dio);

  @override
  Future<Either<Failure,List<PokemonEntity>>> getPokemons() async{
     List<PokemonEntity> pokemons = [];
    try {
      var response = await _dio
          .get('${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20',);

      List listaPokemons = response.data['results'];

      for (int i = 0; i < listaPokemons.length; i++) {
        PokemonEntity? pokemon = await _loadingPokemon(listaPokemons[i]['url']);

        if (pokemon != null) pokemons.add(pokemon);
      }
      
      //TODO verificar se deveria ficar aqui esse offset ou no business
      _offset += 20;

      return Right(pokemons);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> searchPokemonByName(
      String name) async {
    try {
      var response = await _dio.get('${BaseUrl.url}/pokemon/$name');
      var pokemonResponse = response.data;

      PokemonEntity pokemon = PokemonDto.fromJson(pokemonResponse);
      return Right(pokemon);
    } catch (_) {
      return Left(PokemonNotFoundFailure());
    }
  }

  Future<PokemonEntity?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await _dio.get(urlPokemon);

      var pokemonResponse = response.data;

      PokemonEntity pokemon = PokemonDto.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }

}