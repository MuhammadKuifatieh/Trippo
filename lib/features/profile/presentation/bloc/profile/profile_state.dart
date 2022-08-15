part of 'profile_bloc.dart';

enum FavoritePlacesStatus { init, loading, succ, falied }

class ProfileState {
  final FavoritePlacesStatus favoritePlacesStatus;
  final List<PlaceModel> favoritePlaces;
  final bool isEndFavoritePlaces;
  const ProfileState({
    this.favoritePlaces = const [],
    this.isEndFavoritePlaces = false,
    this.favoritePlacesStatus = FavoritePlacesStatus.init,
  });
  ProfileState copyWith({
    FavoritePlacesStatus? favoritePlacesStatus,
    List<PlaceModel>? favoritePlaces,
    bool? isEndFavoritePlaces,
  }) {
    return ProfileState(
      favoritePlaces: favoritePlaces ?? this.favoritePlaces,
      isEndFavoritePlaces: isEndFavoritePlaces ?? this.isEndFavoritePlaces,
      favoritePlacesStatus: favoritePlacesStatus ?? this.favoritePlacesStatus,
    );
  }
}
