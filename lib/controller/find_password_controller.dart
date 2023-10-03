import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/auth_controller.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/widget/app_dialog_only.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var pwFindController = TextEditingController();

  resetPassword(String email) async {
    if (_auth.currentUser?.email == pwFindController.text) {
      Get.find<AuthController>().resetPassword(email);
      await Get.dialog(AppDialogOnly(
        textBold: '작성하신 이메일',
        style: AppTextStyle.koPtBold16(),
        textRegular: '로\n비밀번호 재설정 링크를\n발송하였습니다.',
        buttonText: '확인',
        onPressed: () => Get.offNamed(LoginPage.route),
      ));
    } else {
      await Get.dialog(AppDialogOnly(
        textBold: '존재하지 않는 이메일',
        style: AppTextStyle.koPtBold16red(),
        textRegular: '입니다.\n다시 한번 확인해주세요',
        buttonText: '확인',
        onPressed: () => Get.back(),
      ));
    }
  }
}
