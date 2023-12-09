part of 'guests_bloc.dart';

enum GuestFilter { all, invited, notInvited}

class GuestsState extends Equatable {

  final GuestFilter guestFilter;
  final List<Todo> guestList;

  const GuestsState({
    this.guestFilter = GuestFilter.all,
    this.guestList = const []
  });
  
  @override
  List<Object> get props => [guestFilter, guestList];
}