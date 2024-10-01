// Example of a customizable ProfileMenuWidget
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? textColor;
  final bool endIcon;
  final VoidCallback onPress;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.endIcon = true,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: endIcon
          ? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
          : null,
      onTap: onPress,
    );
  }
}
