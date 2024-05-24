import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/model/photo_model.dart';
import '../../../data/repository/home_repository_implmentation.dart';
part 'populer_photo_state.dart';

class PopulerPhotoCubit extends Cubit<PopulerPhotoState> {
  static PopulerPhotoCubit instances = PopulerPhotoCubit._();
  List<PhotoModel> photos = [];
  int _currentPage = 1;
  bool _loadingFirstPage = true;

  final RefreshController refreshController = RefreshController();
  PopulerPhotoCubit._() : super(PopulerPhotoInitial());

  Future<void> getPopulerPhoto() async {
    if (_loadingFirstPage == true) emit(LoadingPopulerPhotoState());
    var data = await HomeRepositoryImplementation.instanse
        .getPopulerPhotos(page: _currentPage);
    data.fold((failed) {
      photos.clear();
      emit(FialdedPopulerPhotoState(errorMessage: failed.toString()));
    }, (photos) {
      this.photos.addAll(photos);
      emit(SuccessLoadingPopulerPhotoState());
    });
  }

  Future<void> goNextPage() async {
    _loadingFirstPage = false;
    _currentPage++;
    await getPopulerPhoto();
  }
}
