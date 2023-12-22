import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_project/controller/signup_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_routes.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  User? get user => _user.value;
  Rxn<String> profileUrl = Rxn<String>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signup() => SingupController().registerWithEmailAndPassword;

  login(id, pw, ispersisted) => _firebaseAuth
      .signInWithEmailAndPassword(email: id, password: pw)
      .then((_) => true)
      .catchError((_) => false);

  logout() => _firebaseAuth.signOut();

  resetPassword(email) => _firebaseAuth.sendPasswordResetEmail(email: email);

  checkAuthSignup() async {
    var prefs = await SharedPreferences.getInstance();
    var isAutoSignupOn = prefs.getBool('isAutoSignupOn') ?? true;
    if (!isAutoSignupOn) await logout();
    print('로그아웃됨');
  }

  @override
  void onInit() async {
    super.onInit();
    String uid;
    if (FirebaseAuth.instance.currentUser != null) {
      uid = FirebaseAuth.instance.currentUser!.uid;
      await getProfileImageURL(uid);
    }
    await checkAndRequestCameraPermission();
    await checkAuthSignup();
    //Firebase에 유저값이 있으면 메인페이지로 이동, 아니면 로그인페이지
    FirebaseAuth.instance.authStateChanges().listen((value) async {
      print("User Changes: $value");
      _user(value);
      if (Get.currentRoute != AppRoutes.signup) {
        if (value != null) {
          print('페이지 넘어감');
          await Get.offAllNamed(AppRoutes.main);
        } else {
          if (Get.currentRoute != AppRoutes.login) {
            await Get.offAllNamed(AppRoutes.login);
          }
        }
      }
    });
  }

  Future<void> checkAndRequestCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
      print('카메라 작동');
    }
  }

  gallery() async {
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);

    String uid = FirebaseAuth.instance.currentUser!.uid;

    print('이건 되니? : $uid');
    if (res != null) {
      var ref = FirebaseStorage.instance.ref('profile/$uid');
      print('이거는? : $ref');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      _user.value!.updatePhotoURL(downloadUrl);
      profileUrl(downloadUrl);
      print('이미지 선택');
      Get.back();
    }
  }

  camera() async {
    var picker = ImagePicker();
    print('존재하는가? : $picker');
    var res = await picker.pickImage(source: ImageSource.camera);
        print('이건 되니2? : $res');


    String uid = FirebaseAuth.instance.currentUser!.uid;

    if (res != null) {
      var ref = FirebaseStorage.instance.ref('profile/$uid');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      _user.value!.updatePhotoURL(downloadUrl);
      profileUrl(downloadUrl);
    }
  }

Future<void> getProfileImageURL(String uid) async {
  try {
    final FirebaseStorage storage = FirebaseStorage.instance;
    String imagePath = 'profile/$uid';

    Reference ref = storage.ref().child(imagePath);
    String downloadUrl = await ref.getDownloadURL();

    // Update Firestore with the download URL
    await FirebaseFirestore.instance
        .collection('users') // Change this to your Firestore collection
        .doc(uid) // Assuming each user has a document with their UID
        .update({'profileImageUrl': downloadUrl});

    profileUrl.value = downloadUrl;
  } catch (e) {
    print("Error updating Firestore: $e");
  }
}

  void openBottomSheet() {
    Get.bottomSheet(Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              TextButton(onPressed: gallery, child: const Text('앨범에서 사진 선택')),
              TextButton(onPressed: camera, child: const Text('사진찍기')),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.black,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('취소하기', style: AppTextStyle.koPtRegular18white()))
        ])));
  }
}
