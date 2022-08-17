part of 'profile_bloc.dart';

enum FavoritePlacesStatus { init, loading, succ, falied }
enum SendingRequestStatus { init, loading, succ, falied }
enum UpdateProfileStatus { init, loading, succ, falied }

class ProfileState {
  final FavoritePlacesStatus favoritePlacesStatus;
  final UpdateProfileStatus updateProfileStatus;
  final List<PlaceModel> favoritePlaces;
  final bool isEndFavoritePlaces;
  final List<CityModel>? cities;
  final SendingRequestStatus sendingRequestStatus;
  
 const  ProfileState({this.updateProfileStatus = UpdateProfileStatus.init, 
    this.favoritePlaces = const [],
    this.isEndFavoritePlaces = false,
    this.favoritePlacesStatus = FavoritePlacesStatus.init,
    this.cities,
    this.sendingRequestStatus = SendingRequestStatus.init,
  });
  ProfileState copyWith({
    FavoritePlacesStatus? favoritePlacesStatus,
    List<PlaceModel>? favoritePlaces,
    bool? isEndFavoritePlaces,
    List<CityModel>? cities,
    SendingRequestStatus? sendingRequestStatus,
    UpdateProfileStatus? updateProfileStatus,
  }) {
    return ProfileState(
      updateProfileStatus: updateProfileStatus??this.updateProfileStatus,
      favoritePlaces: favoritePlaces ?? this.favoritePlaces,
      isEndFavoritePlaces: isEndFavoritePlaces ?? this.isEndFavoritePlaces,
      favoritePlacesStatus: favoritePlacesStatus ?? this.favoritePlacesStatus,
      cities: cities ?? this.cities,
      sendingRequestStatus: sendingRequestStatus ?? this.sendingRequestStatus,
    );
  }
}
