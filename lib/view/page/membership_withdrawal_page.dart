import 'package:first_project/controller/main_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_bottom_navigation.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MembershipWithdrawalPage extends GetView<MainController> {
  const MembershipWithdrawalPage({super.key});
  static const route = '/membershipWithdrawal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBars(title: '탈퇴하기', color: AppColor.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 48),
                  child: Text(
                    '탈퇴 사유',
                    style: AppTextStyle.koPtBold27(),
                  ),
                ),
                Text(
                  '서비스 불만족',
                  style: AppTextStyle.koPtRegular22(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '개인정보 및 보안 우려',
                  style: AppTextStyle.koPtRegular22(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '사용 빈도가 낮음',
                  style: AppTextStyle.koPtRegular22(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '기타',
                  style: AppTextStyle.koPtRegular22(),
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                      hintText: '기타 사유를 기입해주시기 바랍니다.',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(2)))),
                )
              ],
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height/7,
                child: AppButton(
                    name: '탈퇴하기',
                    color: AppColor.black,
                    style: AppTextStyle.koPtRegular18white(),
                    onPressed: () => Get.dialog(
                          AppDialogs(
                              textBold: '탈퇴하시겠습니까?',
                              style: AppTextStyle.koPtBold27(),
                              textRegular: '',
                              cancelText: '취소',
                              onCancel: () => Get.back(),
                              confirmText: '확인'),
                        )
                    // child: AppButton(
                    //     onPressed: ()
                    //     => Get.dialog(
                    //       AppDialogs(
                    //         textBold: '탈퇴하시겠습니까?',
                    //         style: AppTextStyle.koPtBold16(),
                    //         textRegular: '',
                    //         buttonText1: '취소',
                    //         onPressed1: () => Get.back(),
                    //         buttonText2: '확인'),),
                    //     name: '탈퇴하기',
                    //     color: AppColor.black,
                    //     style: AppTextStyle.koPtRegular18white()),
                    ))
          ],
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => AppBottomNavigate(
      //     selectIndex: controller.selectedIndex.value,
      //     ontap: (index) => controller.navigationOnTap(index),
      //     ),
      // ),
    );
  }
}
