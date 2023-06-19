import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      isEmailverify.value = true;
      print('메일 보내기 성공');
    } catch (e) {
      print('메일 보내기 실패 : $e');
    }
  }

  register() {
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

      Get.offNamed(MainScreen.route);
      return true;
    } catch (e) {
      print('회원가입 오류 : $e');
    }
  }
}
