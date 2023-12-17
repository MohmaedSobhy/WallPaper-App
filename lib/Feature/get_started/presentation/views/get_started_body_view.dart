import 'package:flutter/material.dart';
import 'package:wall_paper/Feature/get_started/presentation/views/get_started_message.dart';

import 'get_started_image.dart';

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
