import 'package:flutter/material.dart';
import '../views/get_started_body_view.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: GetStartedBodyView()),
    );
  }
}
