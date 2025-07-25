import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPhotoView extends StatelessWidget {
  const ShimmerPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
