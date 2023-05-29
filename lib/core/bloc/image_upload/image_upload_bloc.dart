import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/image_model.dart';
import '../../data/repositories/image_upload_repositories_implement.dart';
import '../../domin/usecases/image_upload.dart';
import '../../error/failures.dart';
import '../../use_case/use_case.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final UseCase imageUpload =
      ImageUpload(imageUploadRepository: ImageUploadRepositoriesImplemet());
  ImageUploadBloc() : super(const ImageUploadState()) {
    on<ImageUploadEvent>((event, emit) {});
    on<SetImageEvent>((event, emit) {
      emit(state.copyWith(image: event.image));
      add(const GoImageUploadEvent());
    });
    on<RemoveImageEvent>((event, emit) {
      emit(state.copyWith(
        removeImage: true,
        status: ImageUploadStatus.init,
      ));
    });
    on<GoImageUploadEvent>(_mapGoImageUploadState);
  }
  FutureOr<void> _mapGoImageUploadState(
      GoImageUploadEvent event, Emitter<ImageUploadState> emit) async {
    emit(state.copyWith(status: ImageUploadStatus.loading));
    Either<Failure, ImageUploadModelResponse> result =
        await imageUpload(ImageUploadParams(image: state.image!))
            as Either<Failure, ImageUploadModelResponse>;
    result.fold(
      (l) => emit(state.copyWith(status: ImageUploadStatus.failed)),
      (r) => emit(state.copyWith(
        imageName: r.data!.imageUrl,
        status: ImageUploadStatus.succ,
      )),
    );
  }
}
