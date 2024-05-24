import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/extension/context_extension.dart';

class LoadingCollectionShimmerView extends StatelessWidget {
  const LoadingCollectionShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: context.getScreenWidth() * 0.20,
            margin: EdgeInsets.only(right: 15, left: (index == 0) ? 15 : 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
