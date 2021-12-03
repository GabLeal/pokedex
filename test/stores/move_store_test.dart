import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/repository/move_repository.dart';
import 'package:pokedex/stores/move_store.dart';
import 'package:pokedex/util/enums.dart';

class MoveDetailsRepositoryMock extends Mock implements MoveDetailsRepository {}

main() {
  final repository = MoveDetailsRepositoryMock();

  final store = MoveStore(repository);
  test('should return one Ability', () async {
    when(() => repository.getMoveDetails(urlTest)).thenAnswer((_) async {
      store.moveDetails = MoveDetails();
      store.statusRequestMove = StatusRequest.success;
    });

    store.getMovie(urlTest);
    expect(store.moveDetails, isNotNull);
    expect(store.statusRequestMove, StatusRequest.success);
  });

  test('MoveDetails must be null', () {
    when(() => repository.getMoveDetails(urlTest)).thenAnswer((_) async {
      store.moveDetails = null;
      store.statusRequestMove = StatusRequest.error;
    });

    store.getMovie(urlTest);
    expect(store.moveDetails, isNull);
    expect(store.statusRequestMove, StatusRequest.error);
  });
}

var urlTest = '';
