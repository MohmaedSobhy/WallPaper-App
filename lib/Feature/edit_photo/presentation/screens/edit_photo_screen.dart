import 'package:flutter/material.dart';
import '../views/edit_photo_view_body.dart';
import '../widgets/show_confirmation_dialog.dart';

class EditPhotoScreen extends StatelessWidget {
  final String photoUrl;
  const EditPhotoScreen({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) async {
        if (didPop) {
          return;
        }
        showConfirmationDialoge(context);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: EditPhotoViewBody(
          photoUrl: photoUrl,
        ),
      ),
    );
  }
}
