import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/show_confirmation_dialog.dart';
import 'package:wall_papper/core/extension/context_extension.dart';

import '../widgets/custome_icon_button.dart';

class EditPhotoArrowBack extends StatelessWidget {
  const EditPhotoArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.getScreenHeight() * 0.05,
      left: 15,
      child: CustomeIconButton(
        onTap: () {
          showConfirmationDialoge(context);
        },
        icon: Icons.arrow_back,
      ),
    );
  }
}
