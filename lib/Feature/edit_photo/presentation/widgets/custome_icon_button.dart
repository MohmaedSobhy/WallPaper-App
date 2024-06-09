import 'package:flutter/material.dart';
import 'package:wall_papper/core/styles/colors/app_color.dart';

class CustomeIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CustomeIconButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.backgroundBlack.withOpacity(0.4),
      radius: 22,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon),
        color: Colors.white,
      ),
    );
  }
}
