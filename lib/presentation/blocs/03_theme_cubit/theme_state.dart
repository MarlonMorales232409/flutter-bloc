part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool darkMode;
  const ThemeState({required this.darkMode});

  @override
  List<Object> get props => [darkMode];
}