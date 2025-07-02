import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required super.id, required super.name, required super.image});

  factory PokemonModel.fromJson(json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sprites': {'front_default': image},
      'name': name,
    };
  }
}
