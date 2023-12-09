import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {

    // on<GuestsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

  }
}
