import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../home/data/model/photo_model.dart';
import '../controller/photo_details_cubit.dart';
import '../views/photo_details_view_body.dart';
import '../../../../core/localization/app_string.dart';
import '../../../../core/widget/no_internect_connection.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final PhotoModel photo;
  const PhotoDetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PhotoDetailsCubit.instanse,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: const Text(AppString.detailPhoto),
          actions: [
            IconButton(
              onPressed: () {
                PhotoDetailsCubit.instanse
                    .shareImage(photoUrl: photo.src!.original!);
              },
              icon: const Icon(CupertinoIcons.share),
            )
          ],
        ),
        body: OfflineBuilder(
          connectivityBuilder: (context, connectivity, child) {
            return (connectivity != ConnectivityResult.none)
                ? PhotoDetailsViewBody(
                    photo: photo,
                  )
                : const NoInternetConnection();
          },
          child: PhotoDetailsViewBody(
            photo: photo,
          ),
        ),
      ),
    );
  }
}
