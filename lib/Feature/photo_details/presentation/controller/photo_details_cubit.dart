import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
part 'photo_details_state.dart';

class PhotoDetailsCubit extends Cubit<PhotoDetailsState> {
  PhotoDetailsCubit._() : super(PhotoDetailsInitial());

  static PhotoDetailsCubit instanse = PhotoDetailsCubit._();

  Future<void> downloadImage({required String photoUrl}) async {
    emit(PreparePhotoToDownload());
    await GallerySaver.saveImage(photoUrl).then((value) {
      if (value == true) {
        emit(SuccessDownloadImage());
      } else {
        emit(FailedDownloadImage());
      }
    });
  }

  Future<void> shareImage({required String photoUrl}) async {}
}
