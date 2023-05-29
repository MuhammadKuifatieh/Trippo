part of 'add_experince_bloc.dart';

abstract class AddExperinceEvent {
  const AddExperinceEvent();
}

class GetPlacesToAddExperinceEvent extends AddExperinceEvent {
  final String? name;

  GetPlacesToAddExperinceEvent({
    this.name,
  });
}

class AddToSelectedPlaces extends AddExperinceEvent {
  final PlaceModel place;

  AddToSelectedPlaces({required this.place});
}

class RemveToSelectedPlaces extends AddExperinceEvent {
  final PlaceModel place;

  RemveToSelectedPlaces({required this.place});
}

class GoAddExperinceEvent extends AddExperinceEvent {
  final List<String?> images;
  final String name;
  final String address;
  final String about;
  final String price;

  GoAddExperinceEvent({
    required this.images,
    required this.name,
    required this.address,
    required this.about,
    required this.price,
  });
}
