import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({super.key, required this.hint, this.error, this.controller});
  final String hint;
  final String? error;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 17, 0, 17),
          hintText: hint,
          hintStyle: AppTextStyle.koPtRegular16grey(),
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
