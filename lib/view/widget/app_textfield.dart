import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({super.key, required this.hint, this.error, this.controller, this.obscureText, this.onChanged, this.errorStyle});
  final String hint;
  final String? error;
  final TextEditingController? controller;
  final bool? obscureText;
  final Function(String)? onChanged;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 17, 0, 17),
          hintText: hint,
          hintStyle: AppTextStyle.koPtRegular16grey(),
          errorStyle: errorStyle,
          errorText: error,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.red
            )
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: AppColor.lightgrey
          ),
      ),
    );
  }
}
