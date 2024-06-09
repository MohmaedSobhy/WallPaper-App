import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_icon_button.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/widget/cached_network_image_widget.dart';

class EditPhotoViewBody extends StatelessWidget {
  final String photoUrl;
  const EditPhotoViewBody({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomeCachedNetworkImage(
          photoUrl: photoUrl,
          heigth: double.infinity,
        ),
        Positioned(
          top: context.getScreenHeight() * 0.05,
          left: 15,
          child: CustomeIconButton(
            onTap: () {},
            icon: Icons.arrow_back,
          ),
        ),
        Positioned(
          top: context.getScreenHeight() * 0.05,
          right: 15,
          child: Row(
            children: [
              CustomeIconButton(
                onTap: () {},
                icon: CupertinoIcons.share,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomeIconButton(
                onTap: () {},
                icon: CupertinoIcons.cloud_download,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
