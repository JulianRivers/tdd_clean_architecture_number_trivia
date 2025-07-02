import 'package:clean_architecture_poke_app/core/errors/failures.dart';
import 'package:clean_architecture_poke_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonsLocalDatasource {
  Future<bool> catchPokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getListCatchedPokemons();
}

class HivePokemonLocalDatasourceImpl extends PokemonsLocalDatasource {
  HivePokemonLocalDatasourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> catchPokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());
      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getListCatchedPokemons() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      return box.values.map((p) => PokemonModel.fromJson(p)).toList();
    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }
}
