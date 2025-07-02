import 'package:clean_architecture_poke_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonsRemoteDatasource {
  Future<PokemonModel> getPokemonByID(int id);
}

class PokemonsRemoteDatasourceImpl extends PokemonsRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemonByID(int id) async {
    final resp = await dio.get("https://pokeapi.co/api/v2/pokemon/$id");
    return PokemonModel.fromJson(resp.data);
  }
}
