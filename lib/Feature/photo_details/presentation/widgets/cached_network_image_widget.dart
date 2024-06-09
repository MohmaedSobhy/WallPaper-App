import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomeCachedNetworkImage extends StatelessWidget {
  final String photoUrl;
  const CustomeCachedNetworkImage({
    super.key,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return const Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
