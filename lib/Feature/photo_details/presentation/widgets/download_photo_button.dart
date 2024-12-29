import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/localization/app_string.dart';

class DownloadPhotoButton extends StatelessWidget {
  final VoidCallback onTap;
  const DownloadPhotoButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(
        CupertinoIcons.cloud_download,
        color: Colors.black,
      ),
      label: Text(
        AppString.download,
        style: context.getTheme().textTheme.titleSmall,
      ),
    );
  }
}
