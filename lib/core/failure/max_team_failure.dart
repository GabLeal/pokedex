import 'package:pokedex/core/failure/failure.dart';

class MaxTeamFailure extends Failure {
  MaxTeamFailure({
    String message = 'Your team has the maximum number of pokemons',
  }) : super(message);
}
