import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/network/http_client_interface.dart';
import 'package:pokedex/core/util/base_url.dart';
import 'package:pokedex/layers/data/datasources/remote/pokemon/pokemon_datasource.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

class PokemonDatasourceImp implements PokemonDatasource {
  int _offset = 0;
  final IHttpClient _httpClient;
  PokemonDatasourceImp(this._httpClient);

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons() async {
    List<PokemonEntity> pokemons = [];
    try {
      var response = await _httpClient.get(
        '${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20',
      );

      List listaPokemons = response.body['results'];

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
      var response = await _httpClient.get('${BaseUrl.url}/pokemon/$name');
      if (response.statusCode != 200) return Left(PokemonNotFoundFailure());
      var pokemonResponse = response.body;

      PokemonEntity pokemon = PokemonDto.fromJson(pokemonResponse);
      return Right(pokemon);
    } catch (e) {
      return Left(DatasourceFailure());
    }
  }

  Future<PokemonEntity?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await _httpClient.get(urlPokemon);

      var pokemonResponse = response.body;

      PokemonEntity pokemon = PokemonDto.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }
}
