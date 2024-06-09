import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/controller/edit_photo_cubit.dart';
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
