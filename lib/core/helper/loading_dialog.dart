import 'dart:async';

import 'package:flutter/material.dart';
import '../extension/context_extension.dart';

void showDialogLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showDialogeDownloadState(BuildContext context,
    {required String title, required IconData icon}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.green,
                  size: 55,
                ),
              ),
            ),
            Text(
              title,
              style: context.getTheme().textTheme.titleMedium,
            ),
          ],
        ),
      );
    },
  );
  Timer(const Duration(milliseconds: 500), () {
    Navigator.of(context).pop();
  });
}

void showBanner(
  BuildContext context, {
  Color color = Colors.grey,
  String title = "",
  List<Widget> actions = const [SizedBox()],
}) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      elevation: 1,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      backgroundColor: color,
      content: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
      ),
      actions: actions,
    ),
  );
  Timer(const Duration(milliseconds: 500), () {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  });
}
