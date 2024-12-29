import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/fialed_loading_photos_view.dart';
import '../controller/search_cubit.dart';
import 'no_search_resultes.dart';
import 'success_loading_resultes_view.dart';

class SearchViewResultes extends StatelessWidget {
  const SearchViewResultes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const SliverToBoxAdapter();
        } else if (state is SuccessSearchResultesState) {
          return const SuccessLoadingResultesView();
        } else if (state is FailedSearchResultesState ||
            state is LoadingSearchResultesState) {
          return const FailedLoadingPhotosView();
        }
        return const NoSearchResultesView();
      },
    );
  }
}
