import 'package:pokedex/core/failure/failure.dart';

class PokemonNotFoundFailure extends Failure {
  PokemonNotFoundFailure({
    String message = 'Pokemon not found. Try again.',
  }) : super(message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({
    String message = '',
  }) : super(message);
}
