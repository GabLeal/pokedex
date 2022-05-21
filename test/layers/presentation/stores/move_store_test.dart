import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case.dart';
import 'package:pokedex/layers/presentation/stores/move_store.dart';

class MovesUseCaseMock extends Mock implements MovesUseCase {}

main() {
  final usecaseMock = MovesUseCaseMock();

  late MoveStore store;

  var anyUrl = 'any';

  setUpAll(() {
    store = MoveStore(usecaseMock);
  });

  test('should return one Ability', () async {
    when(
      () => usecaseMock.getMoveDetails(
        any(),
      ),
    ).thenAnswer((_) async {
      return Right(MoveDetailsEntity());
    });

    await store.getMovie(anyUrl);
    expect(store.moveDetails, isNotNull);
    expect(store.statusRequestMove, StatusRequest.success);
  });

  test('MoveDetails must be null', () async {
    when(
      () => usecaseMock.getMoveDetails(
        any(),
      ),
    ).thenAnswer((_) async {
      return Left(
        Failure(''),
      );
    });

    await store.getMovie(anyUrl);
    expect(store.moveDetails, isNull);
    expect(store.statusRequestMove, StatusRequest.error);
  });
}
