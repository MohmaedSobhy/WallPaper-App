import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:wall_papper/core/widget/no_internect_connection.dart';
import '../views/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          return (connectivity != ConnectivityResult.none)
              ? const HomeViewBody()
              : const NoInternetConnection();
        },
        child: const HomeViewBody(),
      ),
    );
  }
}
