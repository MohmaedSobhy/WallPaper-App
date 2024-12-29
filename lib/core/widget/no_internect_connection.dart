import 'package:flutter/material.dart';
import '../extension/context_extension.dart';
import '../styles/colors/app_color.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/no-internet.png",
          height: context.getScreenHeight() * 0.2,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "Check Your Network",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        )
      ],
    );
  }
}
