import 'package:flutter/material.dart';

import 'get_started_image.dart';
import 'get_started_message.dart';

class GetStartedBodyView extends StatelessWidget {
  const GetStartedBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: GetStartedCoverView(),
        ),
        GetStartedMessageView(),
      ],
    );
  }
}
