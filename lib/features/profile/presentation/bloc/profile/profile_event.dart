part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class GetFavoritePlacesEvent extends ProfileEvent {
  final bool isReload;

  GetFavoritePlacesEvent({this.isReload = false});
}

class GetAllCities extends ProfileEvent {}

class HostRequestSended extends ProfileEvent {
  final SendHostParams sendHostParams;

  HostRequestSended(this.sendHostParams);
}
