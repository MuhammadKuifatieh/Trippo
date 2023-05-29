part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent {
  const ImageUploadEvent();
}

class GoImageUploadEvent extends ImageUploadEvent {
  const GoImageUploadEvent();
}

class SetImageEvent extends ImageUploadEvent {
  final Uint8List image;
  SetImageEvent({required this.image});
}

class RemoveImageEvent extends ImageUploadEvent {}
