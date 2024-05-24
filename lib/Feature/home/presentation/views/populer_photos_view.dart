import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wall_papper/Feature/home/presentation/controller/populer%20photo/populer_photo_cubit.dart';
import 'package:wall_papper/core/widget/fialed_loading_photos_view.dart';
import 'package:wall_papper/core/widget/photo_item.dart';

class PopulerPhotosView extends StatelessWidget {
  const PopulerPhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulerPhotoCubit, PopulerPhotoState>(
      builder: (context, state) {
        if (state is SuccessLoadingPopulerPhotoState) {
          return const SuccessLoadingPopulerPhotosView();
        }
        return const FailedLoadingPhotosView();
      },
    );
  }
}

class SuccessLoadingPopulerPhotosView extends StatelessWidget {
  const SuccessLoadingPopulerPhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulerPhotoCubit, PopulerPhotoState>(
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
            childCount: PopulerPhotoCubit.instances.photos.length,
            (context, index) {
              return PhotoItem(
                photo: PopulerPhotoCubit.instances.photos[index],
              );
            },
          ),
        );
      },
    );
  }
}
