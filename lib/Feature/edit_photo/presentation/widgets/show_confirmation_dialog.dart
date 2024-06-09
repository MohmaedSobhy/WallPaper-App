import 'package:flutter/material.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import 'package:wall_papper/core/localization/app_string.dart';

void showConfirmationDialoge(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          AppString.discardEdits,
          style: context.getTheme().textTheme.headlineSmall!.copyWith(
                color: Colors.black,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppString.dicardEditsMessage,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "Cancel",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              "Discard",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          )
        ],
      );
    },
  ).then((result) {
    if (result == true) {
      context.pop();
    }
  });
}
