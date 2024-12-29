import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallypaper_2/Feature/home/presentation/views/collection_list_view.dart';
import 'package:wallypaper_2/Feature/home/presentation/views/populer_photos_view.dart';
import 'package:wallypaper_2/core/extension/context_extension.dart';
import 'package:wallypaper_2/core/localization/app_string.dart';
import '../controller/collections/collections_cubit.dart';

import '../controller/populer photo/populer_photo_cubit.dart';
import 'search_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CollectionsCubit.instances..getColleciton(),
      child: SmartRefresher(
        controller: PopulerPhotoCubit.instances.refreshController,
        enablePullUp: true,
        enablePullDown: false,
        footer: CustomFooter(
          builder: (context, load) {
            if (load == LoadStatus.idle) {
              return const SizedBox();
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        onLoading: () {
          PopulerPhotoCubit.instances.goNextPage().then((value) {
            PopulerPhotoCubit.instances.refreshController.loadComplete();
          });
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                AppString.discover,
                style: context.getTheme().textTheme.headlineSmall,
              ),
              bottom: PreferredSize(
                preferredSize:
                    Size(double.infinity, context.getScreenHeight() * 0.08),
                child: const SearchView(),
              ),
            ),
            SliverPersistentHeader(
              delegate: CollectionListView(),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  AppString.populaImages,
                  style: context.getTheme().textTheme.titleMedium,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              sliver: PopulerPhotosView(),
            )
          ],
        ),
      ),
    );
  }
}
