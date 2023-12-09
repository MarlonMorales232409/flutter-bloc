part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

class SetAllFilterEvent extends GuestsEvent {}
class SetInvitedFilterEvent extends GuestsEvent {}
class SetNotInvitedFilterEvent extends GuestsEvent {}

class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter filter;

  const SetCustomFilterEvent(this.filter);
}
