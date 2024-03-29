import "package:blocs_app/config/config.dart";
import "package:blocs_app/presentation/blocs/05_pokemon_bloc/pokemon_bloc.dart";
import "package:blocs_app/presentation/blocs/bloc.dart";
import "package:get_it/get_it.dart";

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(CounterCubit());

  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc(fetchPokemonName: PokemonInformation.getPokemonName));
}