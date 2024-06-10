import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
  }):super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Icon(icon, color: primaryGrey.shade700),
      title: Text(title,style: bodyXL),
      trailing: Icon(Iconsax.arrow_right_34, size: 15),
    );
  }
}