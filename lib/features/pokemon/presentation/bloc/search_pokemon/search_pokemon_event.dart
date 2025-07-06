part of 'search_pokemon_bloc.dart';

sealed class SearchPokemonEvent extends Equatable {
  const SearchPokemonEvent();

  @override
  List<Object> get props => [];
}

class OnSearchPokemon extends SearchPokemonEvent {}

class OnCatchPokemon extends SearchPokemonEvent {
  final Pokemon pokemon;

  const OnCatchPokemon({required this.pokemon});
}

class OnGetCatchedPokemons extends SearchPokemonEvent {}

