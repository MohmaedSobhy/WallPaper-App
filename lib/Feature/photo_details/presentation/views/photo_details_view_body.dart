import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/home/data/model/photo_model.dart';
import 'package:wall_papper/Feature/photo_details/presentation/controller/photo_details_cubit.dart';
import 'package:wall_papper/Feature/photo_details/presentation/widgets/download_photo_button.dart';
import 'package:wall_papper/Feature/photo_details/presentation/widgets/edit_photo_button.dart';
import 'package:wall_papper/Feature/photo_details/presentation/widgets/loading_dialog.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/extension/string_extension.dart';
import 'package:wall_papper/core/localization/app_string.dart';

class PhotoDetailsViewBody extends StatelessWidget {
  final PhotoModel photo;
  const PhotoDetailsViewBody({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: PhotoDetailsCubit.instanse,
        child: BlocListener<PhotoDetailsCubit, PhotoDetailsState>(
          listener: (context, state) {
            if (state is PreparePhotoToDownload) {
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
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: photo.src!.original!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            photo.photographer!,
                            style: context.getTheme().textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          if (photo.alt != null && photo.alt!.isNotEmpty)
                            Text(
                              photo.alt ?? '',
                              maxLines: 3,
                              style: context.getTheme().textTheme.bodyMedium,
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  shape: BoxShape.circle,
                                  color: photo.avgColor!.toColor(),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                photo.avgColor ?? '',
                                style: context.getTheme().textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const EditPhotoButton(),
                          DownloadPhotoButton(onTap: () {
                            PhotoDetailsCubit.instanse.downloadImage(
                              photoUrl: photo.src!.original!,
                            );
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
