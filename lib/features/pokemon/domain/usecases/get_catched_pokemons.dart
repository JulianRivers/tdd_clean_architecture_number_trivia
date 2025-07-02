import 'package:clean_architecture_poke_app/core/errors/Failures.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatchedPokemonsUseCase {

  final PokemonsRepository repository;

  GetCatchedPokemonsUseCase({required this.repository});

  Future<Either<Failure, List<Pokemon>>> call(){
    return repository.getListCatchedPokemons();
  }
}