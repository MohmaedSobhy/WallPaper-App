import 'package:flutter/material.dart';
import '../../../add_text_layout/screens/add_text_layout.dart';
import '../controller/edit_photo_cubit.dart';
import '../widgets/custome_icon_button.dart';
import '../../../../core/extension/context_extension.dart';

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
