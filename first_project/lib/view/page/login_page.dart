import 'package:first_project/util/app_color.dart';
import 'package:first_project/view/page/find_password_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:first_project/view/widget/app_background.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(children: [
            Row(
              children: const [
                AppBackGround(),
                AppBackGround(),
                AppBackGround(),
                AppBackGround(),
                AppBackGround(),
              ],
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(right: 60, bottom: 38),
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset('assets/images/background_logo.jpeg')))
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(64, 64, 64, 0),
            child: Column(
              children: [
                const AppTextfield(
                  hint: '이메일',
                ),
                const AppTextfield(
                  hint: '비밀번호',
                ),
                Row(
                  children: const [
                    Icon(Icons.check_circle_outline_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text('자동로그인'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                AppButton(name: '로그인', onpressed: () {}, color: AppColor.black),
                Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () =>
                                        Get.toNamed(FindPasswordPage.route),
                                    child: const Text('비밀번호 찾기',
                                        style:
                                            TextStyle(color: AppColor.black))),
                                const Text('|'),
                                TextButton(
                                    onPressed: () =>
                                        Get.toNamed(SignupPage.route),
                                    child: const Text('회원가입',
                                        style:
                                            TextStyle(color: AppColor.black))),
                              ],
                            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
