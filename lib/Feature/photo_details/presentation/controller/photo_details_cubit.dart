import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wall_papper/core/api/dio_service.dart';
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

  Future<void> shareImage({required String photoUrl}) async {
    emit(ShareImageLoading());
    try {
      Response response = await DioService.downloadImage(url: photoUrl);
      if (response.statusCode == 200) {
        emit(SuccessShareImage());
        final tempDirectory = await getTemporaryDirectory();
        final tempFile = File('${tempDirectory.path}/image.jpg');
        await tempFile.writeAsBytes(response.data);
        await Share.shareXFiles([XFile(tempFile.path)]);
      } else {
        emit(FailedToShareImage());
      }
    } catch (error) {
      log(error.toString());
      emit(FailedToShareImage());
    }
  }
}
