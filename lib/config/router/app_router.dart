import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:blocs_app/presentation/screens/screens.dart';


final _publicRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/simple-cubit',
      builder: (context, state) => const CubitScreen(),
    ),

    GoRoute(
      path: '/cubit-router',
      builder: (context, state) => const RouterScreen(),
    ),

    GoRoute(
      path: '/cubit-state',
      builder: (context, state) => const MultipleCubitScreen(),
    ),

    GoRoute(
      path: '/guest-bloc',
      builder: (context, state) => const GuestsScreen(),
    ),

    GoRoute(
      path: '/pokemon-bloc',
      builder: (context, state) => const PokemonScreen(),
    ),

    GoRoute(
      path: '/blocs-with-blocs',
      builder: (context, state) => const BlocsWithBlocsScreen(),
    ),



  ]);


class RouterCubit extends Cubit<GoRouter> {
  RouterCubit(): super(_publicRouter);

  static String lastRoute = '/';

  void goBack() => state.pop();

  void goHome() => state.go('/');

  void _setLastRoute(String route) => lastRoute = route;
}