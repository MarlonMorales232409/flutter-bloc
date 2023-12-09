import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
    on<SetAllFilterEvent>((event, emit) => emit(state.copyWith(guestFilter: GuestFilter.all)));
    on<SetInvitedFilterEvent>((event, emit) => emit(state.copyWith(guestFilter: GuestFilter.invited)));
    on<SetNotInvitedFilterEvent>((event, emit) => emit(state.copyWith(guestFilter: GuestFilter.notInvited)));
  }

  void changeFilter(GuestFilter newFilter) => switch (newFilter) {
        GuestFilter.all => add(SetAllFilterEvent()),
        GuestFilter.invited => add(SetInvitedFilterEvent()),
        GuestFilter.notInvited => add(SetNotInvitedFilterEvent()),
      };
}
