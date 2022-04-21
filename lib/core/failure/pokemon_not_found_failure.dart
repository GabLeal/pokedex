import 'package:pokedex/core/failure/failure.dart';

class PokemonNotFoundFailure extends Failure {
  PokemonNotFoundFailure({
    String message = 'Pokemon not found. Try again.',
  }) : super(message);
}
