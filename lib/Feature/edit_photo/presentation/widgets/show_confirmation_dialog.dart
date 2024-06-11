import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/add_text_layout/controller/add_text_layout_cubit.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/controller/edit_photo_cubit.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_alert_dialoge.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/localization/app_string.dart';

void showConfirmationDialoge(BuildContext context) {
  showDialog(
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
        messageDialog: AppString.dicardEditsMessage,
      );
    },
  ).then((result) {
    if (result == true) {
      EditPhotoCubit.getInstanse().textWidgetVisiable(false);
      AddTextLayoutCubit.instanse.textEditingController.text = '';
      context.pop();
    }
  });
}
