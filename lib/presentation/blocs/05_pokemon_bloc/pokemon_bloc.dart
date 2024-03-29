import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int id) _fetchPokemonName;

  PokemonBloc({required Future<String> Function(int id) fetchPokemonName})
      : _fetchPokemonName = fetchPokemonName,
        super(const PokemonState()) {
    on<PokemonAdded>(pokemonAddedHandler);
  }

  /// *** event callbacks ***

  Future<String> addPokemon(int id) async {
    try {
      if (state.pokemons.containsKey(id)) {
        return state.pokemons[id]!;
      }

      final pokemonName = await PokemonInformation.getPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw "Failed pokemon not found";
    }
  }

  /// *** event handlers ***

  void pokemonAddedHandler(PokemonAdded event, Emitter<PokemonState> emit) {
    final newPokemons = Map<int, String>.from(state.pokemons);
    newPokemons[event.id] = event.name;
    emit(state.copyWith(pokemons: newPokemons));
  }
}
