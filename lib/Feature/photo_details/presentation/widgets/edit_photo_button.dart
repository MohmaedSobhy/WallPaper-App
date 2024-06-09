import 'package:flutter/material.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/localization/app_string.dart';

class EditPhotoButton extends StatelessWidget {
  final VoidCallback onTap;
  const EditPhotoButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        AppString.editPhoto,
        style: context.getTheme().textTheme.titleSmall!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
