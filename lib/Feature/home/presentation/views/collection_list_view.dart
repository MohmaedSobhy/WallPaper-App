import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallypaper_2/Feature/home/presentation/views/shimmer_loading_collection_view.dart';
import 'package:wallypaper_2/Feature/home/presentation/widgets/collection_item.dart';
import 'package:wallypaper_2/core/extension/context_extension.dart';
import 'package:wallypaper_2/core/routes/app_routes.dart';

import '../controller/collections/collections_cubit.dart';

class CollectionListView extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      builder: (context, state) {
        if (state is SuccessLoadingCollection) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CollectionsCubit.instances.collections.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(
                    name: AppRoutes.search,
                    arguments:
                        CollectionsCubit.instances.collections[index].title,
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 8, left: (index == 0) ? 8 : 0),
                  child: CollectionItem(
                    collectionModel:
                        CollectionsCubit.instances.collections[index],
                  ),
                ),
              );
            },
          );
        }
        return const LoadingCollectionShimmerView();
      },
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
