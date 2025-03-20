import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallypaper_2/core/helper/save_image_to_phone.dart';
import '../../../../core/api/dio_service.dart';
part 'photo_details_state.dart';

class PhotoDetailsCubit extends Cubit<PhotoDetailsState> {
  PhotoDetailsCubit._() : super(PhotoDetailsInitial());

  static PhotoDetailsCubit instanse = PhotoDetailsCubit._();

  Future<void> downloadImage({required String photoUrl}) async {
    emit(PreparePhotoToDownload());
    try {
      Response response = await DioService.downloadImage(url: photoUrl);
      var status = await Permission.storage.request();
      if (status.isGranted && response.statusCode == 200) {
        // await ImageGallerySaverPlus.saveImage(
        //   Uint8List.fromList(response.data),
        //   name: "${DateTime.now()}+${photoUrl[0]}",
        // );
        await SaveImageHelper.downloadAndSaveImage(
          response: response,
          fileName: "${DateTime.now()}+${photoUrl[0]}",
        ).then((value) {
          log(value.toString());
        });
        emit(SuccessDownloadImage());
      } else {
        emit(FailedDownloadImage());
      }
    } catch (error) {
      emit(FailedDownloadImage());
    }
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
