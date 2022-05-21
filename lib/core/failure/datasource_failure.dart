import 'package:pokedex/core/failure/failure.dart';

class DatasourceFailure extends Failure {
  DatasourceFailure({
    String message = '',
  }) : super(message);
}

class InternalServerFailure extends Failure {
  InternalServerFailure({
    String message = '',
  }) : super(message);
}
