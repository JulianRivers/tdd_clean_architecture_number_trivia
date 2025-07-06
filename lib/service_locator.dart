import 'package:clean_architecture_poke_app/features/pokemon/data/datasources/pokemons_local_datasource.dart';
import 'package:clean_architecture_poke_app/features/pokemon/data/datasources/pokemons_remote_datasource.dart';
import 'package:clean_architecture_poke_app/features/pokemon/data/repositories/pokemons_repository_impl.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/usecases/catch_pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/usecases/get_catched_pokemons.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/usecases/search_pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/presentation/bloc/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> serviceLocatorInit() async {
  //Bloc
  getIt.registerFactory(() => SearchPokemonBloc(getIt(), getIt(), getIt()));

  //Use Cases
  getIt.registerLazySingleton(() => CatchPokemonUseCase(repository: getIt()));
  getIt.registerLazySingleton(
    () => GetCatchedPokemonsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton(() => SearchPokemonUseCase(repository: getIt()));

  //Repository
  getIt.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      pokemonsLocalDatasource: getIt(),
      pokemonsRemoteDatasource: getIt(),
    ),
  );

  //Data Sources
  getIt.registerLazySingleton<PokemonsLocalDatasource>(
    () => HivePokemonLocalDatasourceImpl(),
  );
  getIt.registerLazySingleton<PokemonsRemoteDatasource>(
    () => PokemonsRemoteDatasourceImpl(),
  );
}
