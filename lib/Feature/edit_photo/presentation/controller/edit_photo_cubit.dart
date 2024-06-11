import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
part 'edit_photo_state.dart';

class EditPhotoCubit extends Cubit<EditPhotoState> {
  static EditPhotoCubit? _instanse;
  EditPhotoCubit._() : super(EditPhotoInitial());
  double imageOpacity = 0;
  bool sliderVisiable = false;
  bool textWidgetIsVisiable = false;
  ScreenshotController screenshotController = ScreenshotController();

  static EditPhotoCubit getInstanse() {
    _instanse ??= EditPhotoCubit._();
    return _instanse!;
  }

  void shareImage() async {
    emit(LoadingEditPhoto());
    screenshotController.capture().then((capturedImage) async {
      try {
        if (capturedImage != null) {
          emit(SucessShareEditPhoto());
          final tempDirectory = await getTemporaryDirectory();
          final tempFile = File('${tempDirectory.path}/image.jpg');
          await tempFile.writeAsBytes(capturedImage);
          await Share.shareXFiles([XFile(tempFile.path)]);
        } else {
          emit(FailedShareEditPhoto());
        }
      } catch (error) {
        emit(FailedShareEditPhoto());
      }
    });
  }

  void downloadImage() {
    emit(LoadingEditPhoto());
    screenshotController.capture().then((capturedImage) async {
      if (capturedImage != null) {
        var status = await Permission.storage.request();
        if (status.isGranted) {
          final name = 'ScreenShot${DateTime.now()}';
          await ImageGallerySaver.saveImage(capturedImage, name: name);
          emit(SuccessDownloadEditPhoto());
        } else {
          emit(FailedDownloadEditPhoto());
        }
      }
    }).catchError((onError) {
      emit(FailedDownloadEditPhoto());
    });
  }

  void changeImageOpacity(double value) {
    imageOpacity = value;
    emit(ChangeImageOpacity());
  }

  void visibilitySlider() {
    sliderVisiable = !sliderVisiable;
    emit(ChangeSliderVisiablity());
  }

  void textWidgetVisiable(bool value) {
    textWidgetIsVisiable = value;
    emit(TextWidgetVisiable());
  }
}
