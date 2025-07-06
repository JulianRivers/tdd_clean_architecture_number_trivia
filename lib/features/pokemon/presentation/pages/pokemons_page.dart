import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:clean_architecture_poke_app/features/pokemon/presentation/widgets/pokemon_card.dart';
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
                  children: [
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnSearchPokemon()),
                      child: Text('Generar Pokemon Aleatorio'),
                    ),
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnGetCatchedPokemons()),
                      child: Text('Ver mis Pokemons Capturados'),
                    ),
                  ],
                ),
              );
            case SearchPokemonSuccess():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PokemonCard(pokemon: state.pokemon),
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnSearchPokemon()),
                      child: Text('Generar Otro Pokemon Aleatorio'),
                    ),
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnGetCatchedPokemons()),
                      child: Text('Ver mis Pokemons Capturados'),
                    ),
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnCatchPokemon(pokemon: state.pokemon)),
                      child: Text('Capturar a ${state.pokemon.name}'),
                    ),
                  ],
                ),
              );
            case SearchPokemonList():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: state.pokemons
                            .map((p) => PokemonCard(pokemon: p))
                            .toList(),
                      ),
                    ),
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnSearchPokemon()),
                      child: Text('Volver y Generar Pokemon Aleatorio'),
                    ),
                  ],
                ),
              );
            case SearchPokemonFailure():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ah ocurrido un error que te parece si lo intentamos de nuevo',
                    ),
                    TextButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                        context,
                      ).add(OnSearchPokemon()),
                      child: Text('Volver y Generar Pokemon Aleatorio'),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
