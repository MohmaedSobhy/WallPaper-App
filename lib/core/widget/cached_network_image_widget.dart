import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomeCachedNetworkImage extends StatelessWidget {
  final String photoUrl;
  final double? heigth;
  const CustomeCachedNetworkImage(
      {super.key, required this.photoUrl, this.heigth});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: heigth,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return const Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
