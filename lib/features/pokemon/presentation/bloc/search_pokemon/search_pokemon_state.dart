part of 'search_pokemon_bloc.dart';

sealed class SearchPokemonState extends Equatable {
  const SearchPokemonState();

  @override
  List<Object> get props => [];
}

final class SearchPokemonInitial extends SearchPokemonState {}

final class SearchPokemonLoading extends SearchPokemonState {}

final class SearchPokemonSuccess extends SearchPokemonState {
  final Pokemon pokemon;

  const SearchPokemonSuccess({required this.pokemon});
}

final class SearchPokemonList extends SearchPokemonState {
  final List<Pokemon> pokemons;

  const SearchPokemonList({required this.pokemons});
}

final class SearchPokemonFailure extends SearchPokemonState {
  final Failure failure;
  const SearchPokemonFailure({required this.failure});
}
