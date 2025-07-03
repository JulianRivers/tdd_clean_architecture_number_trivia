import 'package:clean_architecture_poke_app/core/errors/Failures.dart';
import 'package:clean_architecture_poke_app/features/pokemon/data/datasources/pokemons_local_datasource.dart';
import 'package:clean_architecture_poke_app/features/pokemon/data/datasources/pokemons_remote_datasource.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsLocalDatasource pokemonsLocalDatasource;
  final PokemonsRemoteDatasource pokemonsRemoteDatasource;

  PokemonsRepositoryImpl({
    required this.pokemonsLocalDatasource,
    required this.pokemonsRemoteDatasource,
  });

  @override
  Future<Either<Failure, bool>> catchPokemon(Pokemon pokemon) async {
    try {
      final bool resp = await pokemonsLocalDatasource.catchPokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getListCatchedPokemons() async {
    try {
      final List<Pokemon> resp = await pokemonsLocalDatasource
          .getListCatchedPokemons();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonByID(int id) async {
    try {
      final Pokemon resp = await pokemonsRemoteDatasource.getPokemonByID(id);
      return Right(resp);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
