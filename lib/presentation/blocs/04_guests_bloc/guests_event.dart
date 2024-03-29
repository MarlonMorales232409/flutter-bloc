part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter filter;

  const SetCustomFilterEvent(this.filter);
}

class AddGuestEvent extends GuestsEvent {
  final String name;
  const AddGuestEvent(this.name);
}

class ToggleGuestEvent extends GuestsEvent {
  final String id;
  const ToggleGuestEvent(this.id);
}