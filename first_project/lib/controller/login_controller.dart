import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/auth_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/district_list_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final Rxn<User> _user = Rxn();
  RxBool isAutoSignupOn = false.obs;
  User? get user => _user.value;

  RxBool isButtonActive = false.obs;

// @override
// void onInit() {
//   super.onInit();
//   ever(_user, handleUserChanges);
//   FirebaseAuth.instance.authStateChanges().listen((value) {
//     _user(value);
//   });
// }

// void handleUserChanges(User? user) async {
//   if (user != null) {
//     if (user.emailVerified) {
//       await Get.offNamed(MainScreen.route);
//     }
//   } else {
//     await Get.offNamed(LoginPage.route);
//   }
// }

// login() async {
//   if (emailController.text.isEmpty || pwController.text.isEmpty) {
//     return;
//   }

//   if (await Get.find<AuthController>().login(
//     emailController.text,
//     pwController.text,
//     isAutoSignupOn.value,
//   )) {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isAutoSignupOn', isAutoSignupOn.value);
//   } else {
//     Get.snackbar(
//       '로그인 실패',
//       '이메일 또는 비밀번호를 다시 확인해주세요.',
//       snackPosition: SnackPosition.BOTTOM,
//       duration: const Duration(milliseconds: 3500),
//       backgroundColor: AppColor.black,
//       colorText: AppColor.white,
//     );
//   }
// }

  login() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: pwController.text);

      if (userCredential.user != null) {
        Get.offAllNamed(DistrictList.route);
      } else {
        // 로그인 실패 처리
        //...
      }
    } catch (e) {
      Get.snackbar('로그인 실패', '잘못된 비밀번호입니다. 다시 시도해주세요',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 3000),
          backgroundColor: AppColor.black,
          colorText: AppColor.white);
    }
  }


activeButton() {
  if (emailController.text.isNotEmpty && pwController.text.isNotEmpty) {
    isButtonActive.value = true;
  } else {
    isButtonActive.value = false;
  }
}}
