import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Feature/home/data/model/photo_model.dart';
import '../extension/context_extension.dart';
import '../routes/app_routes.dart';

class PhotoItem extends StatelessWidget {
  final PhotoModel photo;
  const PhotoItem({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(name: AppRoutes.detailPhoto, arguments: photo);
      },
      child: GridTile(
        footer: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.black.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(5),
          child: Text(
            photo.photographer!,
            style: context.getTheme().textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: photo.src!.portrait!,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
