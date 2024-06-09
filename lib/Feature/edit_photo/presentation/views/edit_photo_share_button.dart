import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_papper/core/extension/context_extension.dart';

import '../widgets/custome_icon_button.dart';

class EditPhotoShareButton extends StatelessWidget {
  const EditPhotoShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
