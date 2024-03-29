part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {

  const PokemonState({ this.pokemons = const {}});

  final Map<int, String> pokemons;


   PokemonState copyWith({
    Map<int, String>? pokemons,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
    );
  }
  
  @override
  List<Object?> get props => [pokemons];

 
}
