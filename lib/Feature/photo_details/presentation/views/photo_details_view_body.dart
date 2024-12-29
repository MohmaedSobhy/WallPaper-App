import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/model/photo_model.dart';
import '../controller/photo_details_cubit.dart';
import 'photo_details_information.dart';
import '../widgets/download_photo_button.dart';
import '../widgets/edit_photo_button.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/helper/loading_dialog.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widget/cached_network_image_widget.dart';

import '../../../../core/localization/app_string.dart';

class PhotoDetailsViewBody extends StatelessWidget {
  final PhotoModel photo;
  const PhotoDetailsViewBody({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PhotoDetailsCubit.instanse,
      child: BlocListener<PhotoDetailsCubit, PhotoDetailsState>(
        listener: (context, state) {
          if (state is PreparePhotoToDownload || state is ShareImageLoading) {
            showDialogLoading(context);
          } else if (state is SuccessDownloadImage) {
            Navigator.of(context).pop();
            showDialogeDownloadState(
              context,
              title: AppString.successDownload,
              icon: Icons.check_circle_outline,
            );
          } else if (state is FailedDownloadImage) {
            showDialogeDownloadState(
              context,
              title: AppString.failedDownload,
              icon: Icons.cancel_outlined,
            );
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: CustomeCachedNetworkImage(
                photoUrl: photo.src!.original!,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: context.getScreenHeight() * 0.08,
                  top: 10,
                  right: 10,
                  left: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: PhotoDetailsInfoView(photo: photo),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EditPhotoButton(
                          onTap: () {
                            context.pushNamed(
                                name: AppRoutes.editPhoto,
                                arguments: photo.src!.original);
                          },
                        ),
                        DownloadPhotoButton(
                          onTap: () {
                            PhotoDetailsCubit.instanse.downloadImage(
                              photoUrl: photo.src!.original!,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
