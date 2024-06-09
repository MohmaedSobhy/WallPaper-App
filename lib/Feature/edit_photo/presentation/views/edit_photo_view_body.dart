import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/controller/edit_photo_cubit.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/views/edit_photo_forground.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_icon_button.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import '../../../../core/helper/loading_dialog.dart';
import '../../../../core/localization/app_string.dart';
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
      child: BlocConsumer<EditPhotoCubit, EditPhotoState>(
        listener: (context, state) {
          if (state is SucessShareEditPhoto || state is FailedShareEditPhoto) {
            context.pop();
          } else if (state is LoadingEditPhoto) {
            showDialogLoading(context);
          } else if (state is SuccessDownloadEditPhoto) {
            context.pop();
            showDialogeDownloadState(
              context,
              title: AppString.successDownload,
              icon: Icons.check_circle_outline,
            );
          } else if (state is FailedDownloadEditPhoto) {
            context.pop();
            showDialogeDownloadState(
              context,
              title: AppString.failedDownload,
              icon: Icons.cancel_outlined,
            );
          }
        },
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Screenshot(
                controller: EditPhotoCubit.getInstanse().screenshotController,
                child: EditPhotoForground(photoUrl: photoUrl),
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
