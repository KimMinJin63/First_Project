import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.name,
      this.onPressed,
      required this.color});
  final String name;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(name, style: AppTextStyle.koPtRegular16white()),
    );
  }
}
