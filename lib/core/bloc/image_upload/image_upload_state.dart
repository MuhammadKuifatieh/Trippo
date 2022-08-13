part of 'image_upload_bloc.dart';

enum ImageUploadStatus {
  init,
  succ,
  loading,
  failed,
}

class ImageUploadState {
  final ImageUploadStatus status;
  final String? imageName;
  final Uint8List? image;
  const ImageUploadState({
    this.imageName,
    this.status = ImageUploadStatus.init,
    this.image,
  });
  ImageUploadState copyWith({
    ImageUploadStatus? status,
    String? imageName,
    Uint8List? image,
    bool removeImage = false,
  }) {
    return ImageUploadState(
      status: status ?? this.status,
      imageName: (removeImage) ? null : imageName ?? this.imageName,
      image: (removeImage) ? null : image ?? this.image,
    );
  }
}
