import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wall_papper/Feature/home/presentation/controller/collections/collections_cubit.dart';
import 'package:wall_papper/Feature/home/presentation/views/collection_list_view.dart';
import 'package:wall_papper/Feature/home/presentation/views/populer_photos_view.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/localization/app_string.dart';

import '../controller/populer photo/populer_photo_cubit.dart';
import 'search_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CollectionsCubit.instances..getColleciton(),
        ),
        BlocProvider(
          create: (context) => PopulerPhotoCubit.instances..getPopulerPhoto(),
        ),
      ],
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
              elevation: 0,
              backgroundColor: Colors.white,
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
