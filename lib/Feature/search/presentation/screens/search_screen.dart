import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/custome_text_form_field.dart';
import '../controller/search_cubit.dart';
import '../views/search_view_body.dart';

class SearchScreen extends StatelessWidget {
  final String? searchKey;
  const SearchScreen({super.key, this.searchKey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SearchCubit.instanse..getSearchResultes(searchKey: searchKey),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomeTextFormField(
            controller: SearchCubit.instanse.searchController,
            onFieldSubmitted: (value) {
              if (value.toString().isNotEmpty) {
                SearchCubit.instanse.getSearchResultes(searchKey: value);
              }
            },
          ),
        ),
        body: const CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(12),
              sliver: SearchViewBody(),
            )
          ],
        ),
      ),
    );
  }
}
