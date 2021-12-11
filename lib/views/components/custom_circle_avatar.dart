import 'package:announcements_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    this.backgroundImage,
    this.radius = 50,
  }) : super(key: key);

  final ImageProvider<Object>? backgroundImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primary,
      child: CircleAvatar(
        radius: radius - 3,
        backgroundImage: backgroundImage,
      ),
    );
  }
}