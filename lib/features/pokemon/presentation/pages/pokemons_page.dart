import 'package:clean_architecture_poke_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          switch (state) {
            case SearchPokemonLoading():
              return Center(child: CircularProgressIndicator());
            case SearchPokemonInitial():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [TextButton(onPressed: () {}, child: Container())],
                ),
              );
            case SearchPokemonList():
              return Container(); //TODO
            case SearchPokemonSuccess():
              return Container(); //TODO
            case SearchPokemonFailure():
              return Container(); //TODO
          }
        },
      ),
    );
  }
}
