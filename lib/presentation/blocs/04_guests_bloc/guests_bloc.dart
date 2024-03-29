import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super( GuestsState(
    guestList: [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    ]
  )) {

    on<SetCustomFilterEvent>((event, emit) => emit(state.copyWith(guestFilter: event.filter)));
    on<AddGuestEvent>( _addGuestHandler );
    on<ToggleGuestEvent>( _toggleGuestHandler );
  }

  void changeFilter(GuestFilter newFilter) => add(SetCustomFilterEvent(newFilter));
  void addNewGuest(String name) => add(AddGuestEvent(name));
  void toggleGuest(String id) => add(ToggleGuestEvent(id));


  // *** Event Handlers

  void _addGuestHandler(AddGuestEvent  event, Emitter<GuestsState> emit) {

    final guest = Todo(id: uuid.v4(), description: event.name, completedAt: null);

     emit(state.copyWith(guestList: [...state.guestList, guest]));
  }

  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final guestList = state.guestList.map((guest) {
      if(guest.id == event.id) {
        return guest.copyWith(completedAt: guest.done ? null : DateTime.now());
      }

      return guest;
    });

    emit(state.copyWith(guestList: [...guestList]));
  }
  
}
