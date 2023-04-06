import 'package:flutter/material.dart';
import 'package:budget_tracker_app/theme/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: black.withOpacity(0.1),
          ),
          child: Icon(icon, color: black)),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
      ),
    );
  }
}
