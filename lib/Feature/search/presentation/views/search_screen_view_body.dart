import 'package:flutter/material.dart';
import 'search_view_resultes.dart';

class SearchScreenViewBody extends StatelessWidget {
  const SearchScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SearchViewResultes(),
        )
      ],
    );
  }
}
