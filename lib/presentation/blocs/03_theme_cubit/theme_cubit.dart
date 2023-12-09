import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(darkMode: darkMode));

  void toggleTheme() => emit(ThemeState(darkMode: !state.darkMode));
  
  void setDarkMode() => emit(const ThemeState(darkMode: true));
  
  void setLigthMode() => emit(const ThemeState(darkMode: false));
}
