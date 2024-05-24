import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controller/search_cubit.dart';
import '../../../../core/widget/photo_item.dart';

class SuccessLoadingResultesView extends StatelessWidget {
  const SuccessLoadingResultesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverGrid(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            repeatPattern: QuiltedGridRepeatPattern.mirrored,
            pattern: const [
              QuiltedGridTile(2, 1),
              QuiltedGridTile(1, 1),
            ],
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: SearchCubit.instanse.resultes.length,
            (context, index) {
              return PhotoItem(
                photo: SearchCubit.instanse.resultes[index],
              );
            },
          ),
        );
      },
    );
  }
}
