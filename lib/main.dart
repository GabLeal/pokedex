import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/layers/data/repositories/pokemon_repository_imp.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case_imp.dart';
import 'package:pokedex/layers/presentation/pages/home/home_page.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<PokemonStore>(
            create: (_) => PokemonStore(
              PokemonUseCaseImp(
                PokemonRepositoryImp(
                  dio: Dio(),
                ),
              ),
              CacheFavorites(),
            ),
          )
        ],
        child: MaterialApp(
          builder: BotToastInit(), //1. call BotToastInit
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'PreStart2P',
            textTheme: TextTheme(bodyText1: TextStyle(fontSize: 14.0)),
          ),
          home: HomePage(),
        ));
  }
}
