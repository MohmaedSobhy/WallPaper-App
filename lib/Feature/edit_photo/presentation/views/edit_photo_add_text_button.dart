import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/add_text_layout/screens/add_text_layout.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/controller/edit_photo_cubit.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_icon_button.dart';
import 'package:wall_papper/core/extension/context_extension.dart';

class EditPhotoAddTextButton extends StatelessWidget {
  const EditPhotoAddTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.getScreenHeight() * 0.05,
      left: 75,
      child: CustomeIconButton(
        onTap: () async {
          if (EditPhotoCubit.getInstanse().sliderVisiable) {
            EditPhotoCubit.getInstanse().visibilitySlider();
          }
          EditPhotoCubit.getInstanse().textWidgetVisiable(false);
          showDialog(
            context: context,
            useSafeArea: false,
            builder: (_) {
              return const AddTextLayout();
            },
          ).then((value) {
            if (value) {
              EditPhotoCubit.getInstanse().textWidgetVisiable(value);
            }
          });
        },
        icon: Icons.text_fields_rounded,
      ),
    );
  }
}
