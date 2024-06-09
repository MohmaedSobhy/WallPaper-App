import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/controller/edit_photo_cubit.dart';
import 'package:wall_papper/core/widget/cached_network_image_widget.dart';

class EditPhotoForground extends StatelessWidget {
  final String photoUrl;
  const EditPhotoForground({
    super.key,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomeCachedNetworkImage(
          photoUrl: photoUrl,
          heigth: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
              EditPhotoCubit.getInstanse().imageOpacity,
            ),
          ),
        ),
      ],
    );
  }
}
