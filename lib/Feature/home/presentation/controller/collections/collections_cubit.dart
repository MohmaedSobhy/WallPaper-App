import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository_implmentation.dart';

import '../../../data/model/collection_model.dart';

part 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  static CollectionsCubit instances = CollectionsCubit._();
  List<CollectionModel> collections = [];
  CollectionsCubit._() : super(CollectionsInitial());

  getColleciton() async {
    emit(LoadingCollectionState());
    var data = await HomeRepositoryImplementation.instanse.getCollection();

    data.fold((failed) {
      emit(FailedLoadingCollection(erroMessage: failed.errorMessage));
    }, (success) {
      collections.clear();
      collections.addAll(success);
      emit(SuccessLoadingCollection());
    });
  }
}
