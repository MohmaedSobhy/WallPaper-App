import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/controller/edit_photo_cubit.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/views/edit_photo_forground.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_icon_button.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/widget/cached_network_image_widget.dart';
import 'edit_photo_arrow_back_button.dart';
import 'edit_photo_opacity_slider.dart';
import 'edit_photo_share_button.dart';

class EditPhotoViewBody extends StatelessWidget {
  final String photoUrl;
  const EditPhotoViewBody({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: EditPhotoCubit.getInstanse(),
      child: BlocBuilder<EditPhotoCubit, EditPhotoState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              EditPhotoForground(photoUrl: photoUrl),
              const EditPhotoArrowBack(),
              const EditPhotoShareButton(),
              const EditPhotoOpacitySlider(),
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
        },
      ),
    );
  }
}
