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

  testWidgets('should start favorite pokemons as empty',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final tabFavoritis = find.text('Favorites');
    await tester.tap(tabFavoritis);
    await tester.pumpAndSettle();

    final isEmptyFavoritiesText =
        'You dont have any favorite pokemons yet. Add them to your list.';

    expect(find.text(isEmptyFavoritiesText), findsOneWidget);

    final tabPokemons = find.text('Pokemons');
    await tester.tap(tabPokemons);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
  });

  testWidgets('should favorite a pokemon', (WidgetTester tester) async {
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

  testWidgets('should open the detail of a pokemon ability',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final cardPokemon = find.text('Charizard');
    await tester.tap(cardPokemon);
    await tester.pumpAndSettle();

    final menuMoves = find.byKey(Key('menuMovesKey'));
    await tester.tap(menuMoves);
    await tester.pumpAndSettle();

    final ability = find.byKey(Key('abilityKey0'));
    await tester.tap(ability);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
  });

  testWidgets('should open the detail of a pokemon move',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final cardPokemon = find.text('Charizard');
    await tester.tap(cardPokemon);
    await tester.pumpAndSettle();

    final menuMoves = find.byKey(Key('menuMovesKey'));
    await tester.tap(menuMoves);
    await tester.pumpAndSettle();

    final ability = find.byKey(Key('moveKey0'));
    await tester.tap(ability);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
  });

  testWidgets('should open the detail of a pokemon damage',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final cardPokemon = find.text('Charizard');
    await tester.tap(cardPokemon);
    await tester.pumpAndSettle();

    final menuMoves = find.byKey(Key('menuDamageKey'));
    await tester.tap(menuMoves);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
  });

  group('My team pokemon', () {
    testWidgets('should open the detail and add pokemon in my team.',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final cardPokemon = find.text('Charizard');
      await tester.tap(cardPokemon);
      await tester.pumpAndSettle();

      final pokebola = find.byKey(Key('pokebola'));
      await tester.tap(pokebola);
      await tester.pumpAndSettle();

      await tester.pageBack();
      await tester.pumpAndSettle();

      final pokemon = find.byKey(Key('pokemonMyTeam0'));
      await Future.delayed(const Duration(seconds: 2));

      expect(pokemon, findsOneWidget);
    });

    testWidgets('should open the detail and remove pokemon in my team.',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final cardPokemon = find.text('Charizard');
      await tester.tap(cardPokemon);
      await tester.pumpAndSettle();

      final pokebola = find.byKey(Key('pokebola'));
      await tester.tap(pokebola);
      await tester.pumpAndSettle();

      await tester.pageBack();
      await tester.pumpAndSettle();

      await tester.tap(cardPokemon);
      await tester.pumpAndSettle();
      await tester.tap(pokebola);
      await tester.pumpAndSettle();

      await tester.pageBack();
      await tester.pumpAndSettle();
      final pokemon = find.byKey(Key('pokemonMyTeam0'));

      await Future.delayed(const Duration(seconds: 2));

      expect(pokemon, findsNothing);
    });
  });
}
