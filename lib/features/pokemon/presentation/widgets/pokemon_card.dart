import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(pokemon.image),
          Text(pokemon.name)
        ],
      ),
    );
  }
}