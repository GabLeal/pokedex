import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/move_details_dto.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case_imp.dart';
import 'package:pokedex/layers/presentation/stores/move_store.dart';

class MoveDetailsRepositoryMock extends Mock implements MoveDetailsRepository {}

main() {
  GetIt getIt = GetIt.instance;

  getIt.registerLazySingleton<MoveDetailsRepository>(
    () => MoveDetailsRepositoryMock(),
  );

  getIt.registerLazySingleton<MovesUseCase>(
    () => MovesUseCaseImp(
      getIt.get<MoveDetailsRepository>(),
    ),
  );

  getIt.registerLazySingleton<MoveStore>(
    () => MoveStore(
      getIt.get<MovesUseCase>(),
    ),
  );

  final store = getIt.get<MoveStore>();
  test('should return one Ability', () async {
    when(() => getIt.get<MoveDetailsRepository>().getMoveDetails(urlTest))
        .thenAnswer((_) async {
      store.moveDetails = MoveDetailsDto();
      store.statusRequestMove = StatusRequest.success;
    });

    store.getMovie(urlTest);
    expect(store.moveDetails, isNotNull);
    expect(store.statusRequestMove, StatusRequest.success);
  });

  test('MoveDetails must be null', () {
    when(() => getIt.get<MoveDetailsRepository>().getMoveDetails(urlTest))
        .thenAnswer((_) async {
      store.moveDetails = null;
      store.statusRequestMove = StatusRequest.error;
    });

    store.getMovie(urlTest);
    expect(store.moveDetails, isNull);
    expect(store.statusRequestMove, StatusRequest.error);
  });
}

var urlTest = '';
