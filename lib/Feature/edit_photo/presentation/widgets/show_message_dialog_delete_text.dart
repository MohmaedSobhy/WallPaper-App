import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_alert_dialoge.dart';
import 'package:wall_papper/core/localization/app_string.dart';

Future<bool> showMessageSureToDelteTextDialoge(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomeAlertDialoge(
        cancel: () {
          Navigator.pop(context, false);
        },
        discard: () {
          Navigator.pop(context, true);
        },
        messageDialog: AppString.sureToDeleteText,
      );
    },
  );
}
