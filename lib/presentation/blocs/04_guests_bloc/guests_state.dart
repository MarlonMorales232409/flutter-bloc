part of 'guests_bloc.dart';

enum GuestFilter { all, invited, notInvited}

class GuestsState extends Equatable {

  final GuestFilter guestFilter;
  final List<Todo> guestList;


  int get howManyGuest => guestList.length;

  List<Todo> get getFilteredGuest => switch(guestFilter) {
    GuestFilter.all => guestList,
    GuestFilter.invited => guestList.where((guest) => guest.done).toList(),
    GuestFilter.notInvited => guestList.where((guest) => !guest.done).toList(),
  };

  int get howManyGuestFiltered => getFilteredGuest.length;

  const GuestsState({
    this.guestFilter = GuestFilter.all,
    this.guestList = const []
  });

  GuestsState copyWith({
    GuestFilter? guestFilter,
    List<Todo>? guestList,
  }) => GuestsState(
    guestFilter: guestFilter ?? this.guestFilter,
    guestList: guestList ?? this.guestList,
  );
  
  @override
  List<Object> get props => [guestFilter, guestList];
}