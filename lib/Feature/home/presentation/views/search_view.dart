import 'package:flutter/material.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/localization/app_string.dart';
import 'package:wall_papper/core/routes/app_routes.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(name: AppRoutes.search);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              AppString.search,
              style: context
                  .getTheme()
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
