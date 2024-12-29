import 'package:flutter/cupertino.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/localization/app_string.dart';

class NoSearchResultesView extends StatelessWidget {
  const NoSearchResultesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.getScreenWidth() * 0.35,
                vertical: context.getScreenHeight() * 0.1),
            child: const Image(
              image: AssetImage('assets/search.png'),
            ),
          ),
          Text(
            AppString.noResultes,
            style: context.getTheme().textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
