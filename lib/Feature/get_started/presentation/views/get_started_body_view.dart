import 'package:flutter/material.dart';
import 'package:wall_paper/core/localization/app_string.dart';

import 'get_started_image.dart';

class GetStartedBodyView extends StatelessWidget {
  const GetStartedBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: GetStartedCoverView(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.05,
          ),
          child: Column(
            children: [
              Text(
                AppString.welcomeMessage,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    AppString.exploreMore,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        )
      ],
    );
  }
}
