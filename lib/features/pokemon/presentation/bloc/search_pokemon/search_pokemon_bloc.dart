import 'package:bloc/bloc.dart';
import 'package:clean_architecture_poke_app/core/errors/Failures.dart';
import 'package:clean_architecture_poke_app/core/utils/utils.dart' as utils;
import 'package:clean_architecture_poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/usecases/catch_pokemon.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/usecases/get_catched_pokemons.dart';
import 'package:clean_architecture_poke_app/features/pokemon/domain/usecases/search_pokemon.dart';
import 'package:equatable/equatable.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CatchPokemonUseCase _catchPokemonUseCase;
  final GetCatchedPokemonsUseCase _getCatchedPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  SearchPokemonBloc(
    this._catchPokemonUseCase,
    this._getCatchedPokemonsUseCase,
    this._searchPokemonUseCase,
  ) : super(SearchPokemonInitial()) {
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonLoading());
      final resp = await _searchPokemonUseCase(utils.randomPokemonId);
      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (p) => emit(SearchPokemonSuccess(pokemon: p)),
      );
    });

    on<OnCatchPokemon>((event, emit) async {
      final resp = await _catchPokemonUseCase(event.pokemon);
      resp.fold((f) => emit(SearchPokemonFailure(failure: f)), (p) {});
    });

    on<OnGetCatchedPokemons>((event, emit) async {
      final resp = await _getCatchedPokemonsUseCase();
      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (ps) => SearchPokemonList(pokemons: ps),
      );
    });
  }
}
