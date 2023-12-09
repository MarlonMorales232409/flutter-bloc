import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String> {

  UsernameCubit(): super('No Username');

  void setUsername(String username) => emit(username);

}