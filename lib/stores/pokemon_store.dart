import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/util/base_url.dart';
import 'package:pokedex/util/enums.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  StatusRequest statusRequest = StatusRequest.empty;

  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>().asObservable();

  int _offset = -20;

  @action
  getPokemons() async {
    _offset += 20;
    Dio dio = Dio();
    Response response;
    try {
      statusRequest = StatusRequest.loading;
      response = await dio
          .get('${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20');

      List listaPokemons = response.data['results'];

      for (int i = 0; i < listaPokemons.length; i++) {
        await loadingPokemon(listaPokemons[i]['url']);
      }

      statusRequest = StatusRequest.success;
    } catch (erro) {
      statusRequest = StatusRequest.error;
      print(erro);
    }
  }

  Future<void> loadingPokemon(String urlPokemon) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(urlPokemon);

      var pokemonResponse = response.data;

      Pokemon pokemon = Pokemon.fromJson(pokemonResponse);
      pokemons.add(pokemon);
    } catch (erro) {
      statusRequest = StatusRequest.error;
      print(erro);
    }
  }

  searchPokemonByName(String name) async {
    statusRequest = StatusRequest.loading;
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get('${BaseUrl.url}/pokemon/$name');

      var pokemonResponse = response.data;

      Pokemon pokemon = Pokemon.fromJson(pokemonResponse);
      pokemons.add(pokemon);
      statusRequest = StatusRequest.success;
    } catch (erro) {
      statusRequest = StatusRequest.error;
      print(erro);
    }
  }
}
