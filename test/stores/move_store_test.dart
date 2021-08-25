import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/model/move_details.dart';
import 'package:pokedex/repository/move_repository.dart';
import 'package:pokedex/stores/move_store.dart';
import 'package:pokedex/util/enums.dart';

class MoveDetailsRepositoryMock extends Mock implements MoveDetailsRepository {}

main() {
  final repository = MoveDetailsRepositoryMock();

  final store = MoveStore(repository);
  test('deve receber um MoveDetails', () async {
    when(() => repository.getMoveDetails(urlTest)).thenAnswer((_) async {
      store.moveDetails = MoveDetails();
      store.statusRequestMove = StatusRequest.success;
    });

    store.getMovie(urlTest);
    expect(store.moveDetails, isNotNull);
    expect(store.statusRequestMove, StatusRequest.success);
  });

  test('MoveDetails deve ser null', () {
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
