import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:wall_papper/Feature/search/presentation/views/search_screen_view_body.dart';
import 'package:wall_papper/core/widget/no_internect_connection.dart';
import '../../../../core/widget/custome_text_form_field.dart';
import '../controller/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  final String? searchKey;
  const SearchScreen({super.key, this.searchKey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SearchCubit.instanse..getSearchResultes(searchKey: searchKey),
      child: Scaffold(
        appBar: AppBar(
          title: CustomeTextFormField(
            controller: SearchCubit.instanse.searchController,
            onFieldSubmitted: (value) {
              if (value.toString().isNotEmpty) {
                SearchCubit.instanse.getSearchResultes(searchKey: value);
              }
            },
          ),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (context, connectivity, child) {
            return (connectivity != ConnectivityResult.none)
                ? const SearchScreenViewBody()
                : const Center(
                    child: NoInternetConnection(),
                  );
          },
          child: const SearchScreenViewBody(),
        ),
      ),
    );
  }
}
