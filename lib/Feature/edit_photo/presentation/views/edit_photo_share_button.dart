import 'package:flutter/cupertino.dart';
import '../controller/edit_photo_cubit.dart';
import '../../../../core/extension/context_extension.dart';

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
            onTap: () {
              EditPhotoCubit.getInstanse().shareImage();
            },
            icon: CupertinoIcons.share,
          ),
          const SizedBox(
            width: 20,
          ),
          CustomeIconButton(
            onTap: () {
              EditPhotoCubit.getInstanse().downloadImage();
            },
            icon: CupertinoIcons.cloud_download,
          ),
        ],
      ),
    );
  }
}
