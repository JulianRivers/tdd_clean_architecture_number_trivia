
import 'package:clean_architecture_poke_app/core/errors/Failures.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonsRepository {

Future<Either<Failure, Pokemon>> getPokemonByID(int id);
Future<Either<Failure, bool>> catchPokemon(Pokemon pokemon);
Future<Either<Failure, List<Pokemon>>> getListCatchedPokemons();

} 