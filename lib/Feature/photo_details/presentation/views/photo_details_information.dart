import 'package:flutter/widgets.dart';
import 'package:wall_papper/Feature/home/data/model/photo_model.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/extension/string_extension.dart';

class PhotoDetailsInfoView extends StatelessWidget {
  final PhotoModel photo;
  const PhotoDetailsInfoView({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          photo.photographer!,
          style: context.getTheme().textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        if (photo.alt != null && photo.alt!.isNotEmpty)
          Text(
            photo.alt ?? '',
            maxLines: 3,
            style: context.getTheme().textTheme.bodyMedium,
          ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
                color: photo.avgColor!.toColor(),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              photo.avgColor ?? '',
              style: context.getTheme().textTheme.titleSmall,
            ),
          ],
        ),
      ],
    );
  }
}
