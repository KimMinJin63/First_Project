import 'package:first_project/controller/find_password_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class FindPasswordPage extends GetView<FindPasswordController> {
  const FindPasswordPage({super.key});
  static const route = '/findPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColor.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Text('비밀번호 재설정', style: AppTextStyle.koPtBold32()),
                const SizedBox(
                  height: 15,
                ),
                Text('가입시 사용한 이메일을 통해\n비밀번호를 재설정 하실 수 있습니다.', 
                style: AppTextStyle.koPtRegular16(),
                textAlign: TextAlign.center,),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/7*5,
                      child: AppTextfield(
                        hint: '이메일을 입력해주세요'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: AppButton(
                          name: '전송', 
                          onPressed: () => controller.resetPassword(controller.pwFindController.text), 
                          color: AppColor.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}