import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_photo_state.dart';

class EditPhotoCubit extends Cubit<EditPhotoState> {
  static EditPhotoCubit? _instanse;
  EditPhotoCubit._() : super(EditPhotoInitial());
  double imageOpacity = 0;
  bool sliderVisiable = false;
  static EditPhotoCubit getInstanse() {
    _instanse ??= EditPhotoCubit._();
    return _instanse!;
  }

  void shareImage() {}

  void downloadImage() {}

  void changeImageOpacity(double value) {
    imageOpacity = value;
    emit(ChangeImageOpacity());
  }

  void visibilitySlider() {
    sliderVisiable = !sliderVisiable;
    emit(ChangeSliderVisiablity());
  }
}
