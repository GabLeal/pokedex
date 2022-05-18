import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case_imp.dart';

class MoveDetailsRepositoryMock extends Mock implements MoveDetailsRepository {}

void main() {
  final repository = MoveDetailsRepositoryMock();
  final moveDetailsUseCase = MovesUseCaseImp(repository);

  group('[USECASE MOVES DETAILS]', () {
    test('Deve retornar MoveDetailsEntity', () async {
      when(() => repository.getMoveDetails(any())).thenAnswer((_) async {
        return MoveDetailsEntity();
      });

      var result = await moveDetailsUseCase.getMoveDetails('url');

      expect(result, isA<MoveDetailsEntity>());
    });

    test('Deve retornar null', () async {
      when(() => repository.getMoveDetails(any())).thenAnswer((_) async {
        return null;
      });

      var result = await moveDetailsUseCase.getMoveDetails('url');

      expect(result, isNull);
    });
  });
}
