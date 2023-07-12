import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingupController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwConfirmController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isEmailverify = false.obs;
  Rxn<String> pwError = Rxn<String>(); //패스워드 에러 메세지
  Rxn<String> emailError = Rxn<String>(); //이메일 에러 메세지
  Rxn<String> pwConfirmError = Rxn<String>();
  RxBool isButtonActivated = true.obs; //회원가입 버튼 활성화 여부
  // final Rxn<User> _user = Rxn();
  // User? get user => _user.value;

  registerWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: pwController.text);
      User? user = userCredential.user;
      isEmailverify.value = false;

      await user!.sendEmailVerification();

      Get.snackbar('메일 전송 성공!', '메일이 성공적으로 전송되었습니다. 메일을 확인해주세요.');
      // isEmailverify.value = true;
      print('메일 보내기 성공');
      activeButton();
    } catch (e) {
      Get.snackbar('메일 전송 실패!', '메일 전송에 실패하였습니다. 이메일을 다시 확인해주세요.');
      print('메일 보내기 실패 : $e');
    }
  }

  Future<bool> register() async {
    final String name = nameController.text.trim();
    final String id = emailController.text.trim();
    final String password = pwController.text.trim();

    try {
      User? user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      _firestore.collection('user').doc(uid).set({
        'name': name,
        'id': id,
        'password': password,
      });

      await user.sendEmailVerification();
      Get.offNamed(LoginPage.route);
      return true;
    } catch (e) {
      print('회원가입 오류 : $e');
      return false;
    }
  }

  checkPassword(String value) {
    if (value.isNotEmpty &&
        !RegExp(r'^((?=.*\d{1})(?=.*[a-zA-Z]{1}))+[a-zA-Z0-9]{8,}$').hasMatch(value)) {
      pwError('비밀번호는 8자리 이상 영문 숫자 혼합이어야 합니다.');
    } else {
      pwError.value = null;
    }
  }

  checkEmail(String value) {
    if (value.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
      emailError('이메일 형식이 맞지 않습니다.');
    }else{
      emailError.value = null;
    }
  }

  checkConfirmPassword(String value) {
    if (value.isNotEmpty && value != pwController.text) {
      pwConfirmError('비밀번호가 일치하지 않습니다');
    }else {
      pwConfirmError.value = null;
    }
  }

  activeButton() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        pwConfirmController.text.isNotEmpty &&
        pwError.value == null &&
        pwConfirmError.value == null) {
      isEmailverify.value = true;
      isButtonActivated.value = true;
    } else {
      isButtonActivated.value = false;
    }
  }
}
