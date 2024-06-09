import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_icon_button.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/show_confirmation_dialog.dart';
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
            onTap: () {
              showConfirmationDialoge(context);
            },
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
        Positioned(
          bottom: context.getScreenHeight() * 0.05,
          left: 15,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: context.getScreenHeight() * 0.5,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    min: 0,
                    max: 1,
                    value: 0.5,
                    onChanged: (value) {},
                  ),
                ),
              ),
              CustomeIconButton(
                onTap: () {},
                icon: CupertinoIcons.layers,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: context.getScreenHeight() * 0.05,
          left: 75,
          child: CustomeIconButton(
            onTap: () {},
            icon: Icons.text_fields_rounded,
          ),
        ),
      ],
    );
  }
}
