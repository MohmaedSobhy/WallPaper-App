import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/model/photo_model.dart';
import '../../data/respository/search_repository_implmentation.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit._() : super(SearchInitial());
  List<PhotoModel> resultes = [];
  static SearchCubit instanse = SearchCubit._();
  final TextEditingController searchController = TextEditingController();

  void getSearchResultes({String? searchKey}) async {
    if (checkSearchKey(searchKey: searchKey) == false) return;
    emit(LoadingSearchResultesState());
    resultes.clear();

    var data = await SearchRepositoryImplmentation.instanse
        .getSearchResultes(searchKey: searchKey!);

    data.fold((failed) {
      emit(FailedSearchResultesState());
    }, (photos) {
      resultes.addAll(photos);
      emit(SuccessSearchResultesState());
    });
  }

  bool checkSearchKey({String? searchKey}) {
    if (searchKey == null) return false;
    _initTextController(text: searchKey);
    return true;
  }

  void _initTextController({required String text}) {
    searchController.text = text;
  }
}
