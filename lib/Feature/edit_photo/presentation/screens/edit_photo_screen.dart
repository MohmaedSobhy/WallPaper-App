import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/views/edit_photo_view_body.dart';

class EditPhotoScreen extends StatelessWidget {
  final String photoUrl;
  const EditPhotoScreen({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: EditPhotoViewBody(
        photoUrl: photoUrl,
      ),
    );
  }
}
