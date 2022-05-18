import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/layers/data/datasources/local/my_favorities/my_favorites_datasorce.dart';
import 'package:pokedex/layers/data/datasources/local/my_favorities/my_favorites_datasorce_imp.dart';
import 'package:pokedex/layers/data/datasources/local/my_team/my_team_datasorce.dart';
import 'package:pokedex/layers/data/datasources/local/my_team/my_team_datasource_imp.dart';
import 'package:pokedex/layers/data/repositories/ability_repository_imp.dart';
import 'package:pokedex/layers/data/repositories/move_repository_imp.dart';
import 'package:pokedex/layers/data/repositories/my_favorites_repository_imp.dart';
import 'package:pokedex/layers/data/repositories/my_team_repository_imp.dart';
import 'package:pokedex/layers/data/repositories/pokemon_repository_imp.dart';
import 'package:pokedex/layers/data/repositories/type_damage_repository_imp.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/layers/domain/repositories/my_favorites_repository.dart';
import 'package:pokedex/layers/domain/repositories/my_team_repository.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case_imp.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case_imp.dart';
import 'package:pokedex/layers/domain/usercases/my_favorites/my_favorites_use_case.dart';
import 'package:pokedex/layers/domain/usercases/my_favorites/my_favorites_use_case_imp.dart';
import 'package:pokedex/layers/domain/usercases/my_team/my_team_use_case.dart';
import 'package:pokedex/layers/domain/usercases/my_team/my_team_use_case_imp.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case_imp.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case_imp.dart';
import 'package:pokedex/layers/presentation/stores/ability_store.dart';
import 'package:pokedex/layers/presentation/stores/move_store.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:pokedex/layers/presentation/stores/type_damage_store.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //TODO datasourcer
    getIt.registerLazySingleton<MyTeamDatasource>(
      () => MyTeamDatasourceImp(),
    );
    getIt.registerLazySingleton<MyFavoritesDatasource>(
      () => MyFavoritesDatasourceImp(),
    );
    //REPOSITORIES

    getIt.registerLazySingleton<AbilityDetailsRepository>(
      () => AbilityDetailsRepositoryImp(
        dio: Dio(),
      ),
    );

    getIt.registerLazySingleton<MoveDetailsRepository>(
      () => MoveDetailsRepositoryImp(
        dio: Dio(),
      ),
    );

    getIt.registerLazySingleton<TypeDamageRepository>(
      () => TypeDamageRepositoryImp(
        dio: Dio(),
      ),
    );

    getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImp(
        dio: Dio(),
      ),
    );

    getIt.registerLazySingleton<MyTeamRepository>(
      () => MyTeamRepositoryImp(
        getIt<MyTeamDatasource>(),
      ),
    );

    getIt.registerLazySingleton<MyFavoritesRepository>(
      () => MyFavoritesRepositoryImp(
        getIt<MyFavoritesDatasource>(),
      ),
    );

    //USECASES
    getIt.registerLazySingleton<AbilityDetailsUseCase>(
      () => AbilityDetailsUseCaseImp(
        getIt.get<AbilityDetailsRepository>(),
      ),
    );

    getIt.registerLazySingleton<MovesUseCase>(
      () => MovesUseCaseImp(
        getIt.get<MoveDetailsRepository>(),
      ),
    );

    getIt.registerLazySingleton<TypeDamageUseCase>(
      () => TypeDamageUseCaseImp(
        getIt.get<TypeDamageRepository>(),
      ),
    );

    getIt.registerLazySingleton<PokemonUseCase>(
      () => PokemonUseCaseImp(
        getIt.get<PokemonRepository>(),
      ),
    );

    getIt.registerLazySingleton<MyTeamUseCase>(
      () => MyTeamUseCaseImp(
        getIt<MyTeamRepository>(),
      ),
    );

    getIt.registerLazySingleton<MyFavoritesUseCase>(
      () => MyFavoritesUseCaseImp(
        getIt<MyFavoritesRepository>(),
      ),
    );

    //CONTROLLERSß
    getIt.registerLazySingleton<AbilityStore>(
      () => AbilityStore(
        getIt.get<AbilityDetailsUseCase>(),
      ),
    );

    getIt.registerLazySingleton<MoveStore>(
      () => MoveStore(
        getIt.get<MovesUseCase>(),
      ),
    );

    getIt.registerLazySingleton<TypeDamageStore>(
      () => TypeDamageStore(
        getIt.get<TypeDamageUseCase>(),
      ),
    );

    getIt.registerLazySingleton<PokemonStore>(
      () => PokemonStore(
        getIt<PokemonUseCase>(),
        getIt<MyTeamUseCase>(),
        getIt<MyFavoritesUseCase>(),
      ),
    );
  }
}
