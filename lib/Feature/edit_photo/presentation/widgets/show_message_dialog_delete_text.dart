import 'package:flutter/material.dart';
import '../../../../core/localization/app_string.dart';

import 'custome_alert_dialoge.dart';

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
