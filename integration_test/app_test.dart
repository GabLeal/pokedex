import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokedex/layers/presentation/components/card_pokemon_widget.dart';

import 'package:pokedex/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    GetIt getIt = GetIt.I;
    getIt.reset();
  });

  testWidgets('should init 20 pokemons', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    var allCards = find.byType(CarPokemonWidget, skipOffstage: false);

    expect(allCards, findsWidgets);
  });

  testWidgets('should init favorities pokemons is empty',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final tabFavoritis = find.text('Favorites');
    await tester.tap(tabFavoritis);
    await tester.pumpAndSettle();

    final isEmptyFavoritiesText =
        'Você ainda não possuim pokemons favoritos. Adicone eles a sua lista.';

    expect(find.text(isEmptyFavoritiesText), findsOneWidget);

    final tabPokemons = find.text('Pokemons');
    await tester.tap(tabPokemons);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
  });

  testWidgets('should favorities one pokemons', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final card1 = find.byKey(Key('cardPokemon1'));
    await tester.tap(card1);
    await tester.pumpAndSettle();

    final starFavorite = find.byKey(Key('isFavorite'));
    await tester.tap(starFavorite);
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();

    final tabFavoritis = find.text('Favorites');
    await tester.tap(tabFavoritis);
    await tester.pumpAndSettle();

    //desmarcar favorito
    final card0 = find.byKey(Key('cardPokemon0'));

    expect(card0, findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
  });

  testWidgets('should remove one favorite pokemon',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final card1 = find.text('Charizard');
    await tester.tap(card1);
    await tester.pumpAndSettle();

    final starFavorite = find.byKey(Key('isFavorite'));
    await tester.tap(starFavorite);
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();

    final tabFavoritis = find.text('Favorites');
    await tester.tap(tabFavoritis);
    await tester.pumpAndSettle();

    final card0 = find.text('Charizard');
    await tester.tap(card0);
    await tester.pumpAndSettle();
    final starIsNotFavorite = find.byKey(Key('isNotFavorite'));
    await tester.tap(starIsNotFavorite);
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text('Charizard'), findsNothing);
  });

  testWidgets('should search one pokemon', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final searchButton = find.byKey(Key('searchKey'));
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    final inputSeachPokemon = find.byType(TextField);

    await tester.enterText(inputSeachPokemon, 'mew');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text('Moves'), findsOneWidget);
  });

  testWidgets('should search one invalid pokemon', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final searchButton = find.byKey(Key('searchKey'));
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    final inputSeachPokemon = find.byType(TextField);

    await tester.enterText(inputSeachPokemon, 'any pokemon');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text('Pokemon not found. Try again.'), findsOneWidget);
  });

  //group('end-to-end test', () {
  // testWidgets('tap on the floating action button, verify counter',
  //     (WidgetTester tester) async {
  //   app.main();
  //   await tester.pumpAndSettle();

  //   expect(find.text('Pokedex'), findsOneWidget);

  //   final listFinder = find.byKey(ValueKey('gridPokemons'));

  //   expect(listFinder, findsOneWidget);

  //   final itemFinder = find.byKey(Key('cardPokemon5'));
  //   expect(itemFinder, findsOneWidget);

  //   await tester.drag(itemFinder, Offset(0, -1000));
  //   await tester.pumpAndSettle();

  //   await Future.delayed(const Duration(seconds: 1));

  //   final tabFavoritis = find.text('Favorites');
  //   await tester.tap(tabFavoritis);
  //   await tester.pumpAndSettle();

  //   final isEmptyFavoritiesText =
  //       'Você ainda não possuim pokemons favoritos. Adicone eles a sua lista.';

  //   expect(find.text(isEmptyFavoritiesText), findsOneWidget);

  //   await Future.delayed(const Duration(seconds: 2));

  //   final tabPokemons = find.text('Pokemons');
  //   await tester.tap(tabPokemons);
  //   await tester.pumpAndSettle();

  //   final card1 = find.byKey(Key('cardPokemon1'));
  //   await tester.tap(card1);
  //   await tester.pumpAndSettle();

  //   final starFavorite = find.byKey(Key('isFavorite'));
  //   await tester.tap(starFavorite);
  //   await tester.pumpAndSettle();
  //   await tester.pageBack();
  //   await tester.pumpAndSettle();

  //   await tester.tap(tabFavoritis);
  //   await tester.pumpAndSettle();

  //   //desmarcar favorito
  //   final card0 = find.byKey(Key('cardPokemon0'));
  //   await tester.tap(card0);
  //   await tester.pumpAndSettle();

  //   final starIsNotFavorite = find.byKey(Key('isNotFavorite'));
  //   await tester.tap(starIsNotFavorite);
  //   await tester.pumpAndSettle();
  //   await tester.pageBack();
  //   await tester.pumpAndSettle();

  //   await Future.delayed(const Duration(seconds: 2));
  // });
  //});
}
