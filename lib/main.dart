import 'package:flutter/material.dart';
import 'package:pokedex/pages/home/home_page.dart';
import 'package:pokedex/splash_screen.dart';
import 'package:pokedex/stores/pokemon_store.dart';
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
        providers: [Provider<PokemonStore>(create: (_) => PokemonStore())],
        child: MaterialApp(
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
