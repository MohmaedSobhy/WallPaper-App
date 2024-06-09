import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_photo_state.dart';

class EditPhotoCubit extends Cubit<EditPhotoState> {
  static EditPhotoCubit? _instanse;
  EditPhotoCubit._() : super(EditPhotoInitial());
  double imageOpacity = 0.5;
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
}
