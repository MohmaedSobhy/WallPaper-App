import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/home/data/model/collection_model.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/styles/colors/app_color.dart';

class CollectionItem extends StatelessWidget {
  final CollectionModel collectionModel;
  const CollectionItem({super.key, required this.collectionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        collectionModel.title,
        style: context.getTheme().textTheme.titleSmall!.copyWith(
              color: Colors.white,
            ),
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
