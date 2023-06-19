import 'package:first_project/util/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle koPtBold35white() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 35, color: AppColor.white);

  static TextStyle koPtBold32() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 32, color: AppColor.black);

  static TextStyle koPtSemiBold32() => const TextStyle(
      fontFamily: 'PretendardSemiBold', fontSize: 32, color: AppColor.black);

  static TextStyle koPtRegular16grey() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 16, color: AppColor.grey);

  static TextStyle koPtRegular16() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 16, color: AppColor.black);

  static TextStyle koPtRegular16white() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 16, color: AppColor.white);

  static TextStyle koPtRegular14() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 14, color: AppColor.black);
}
