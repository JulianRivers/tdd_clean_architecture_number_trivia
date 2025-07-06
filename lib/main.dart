import 'package:clean_architecture_poke_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:clean_architecture_poke_app/service_locator.dart';
import 'package:clean_architecture_poke_app/features/pokemon/presentation/pages/pokemons_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<SearchPokemonBloc>()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonsPage(),
    );
  }
}
