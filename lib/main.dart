import 'package:flutter/material.dart';
import 'package:pokedex/pages/home/home_page.dart';

void main() {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PreStart2P',
        textTheme: TextTheme(bodyText1: TextStyle(fontSize: 14.0)),
      ),
      home: HomePage(),
    );
  }
}
