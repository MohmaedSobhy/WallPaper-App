import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/localization/app_string.dart';

class CustomeAlertDialoge extends StatelessWidget {
  final String messageDialog;
  final VoidCallback cancel, discard;
  const CustomeAlertDialoge({
    super.key,
    required this.messageDialog,
    required this.cancel,
    required this.discard,
  });

  @override
  Widget build(BuildContext context) {
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
            messageDialog,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: Text(
            "Cancel",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        ElevatedButton(
          onPressed: discard,
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
  }
}
