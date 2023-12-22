import 'package:first_project/controller/auth_controller.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/membership_withdrawal_page.dart';
import 'package:first_project/view/page/review_page.dart';
import 'package:first_project/view/widget/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScreen extends GetView<AuthController> {
  const MyScreen({super.key});
  static const route = '/myScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: const BoxDecoration(color: AppColor.black),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 50,
                          backgroundImage: controller.profileUrl.value != null
                              ? NetworkImage(controller.profileUrl.value!)
                              : const AssetImage('assets/images/logo.jpeg')
                                  as ImageProvider<Object>?,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: controller.openBottomSheet,
                            child: Badge(
                              largeSize: 30,
                              backgroundColor: AppColor.white,
                              label: Icon(Icons.edit),
                            ),
                          ))
                    ]),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'molly63@naver.com',
                      style: AppTextStyle.koPtRegular18white(),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '리뷰 관리',
                    style: AppTextStyle.koPtSemiBold24(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Text(
                              '리뷰 작성',
                              style: AppTextStyle.koPtRegular18white(),
                            ),
                            onTap: () => Get.toNamed(ReviewPage.route),
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 7,
                            endIndent: 7,
                            color: AppColor.white,
                          ),
                          Text(
                            '내가 쓴 리뷰 관리',
                            style: AppTextStyle.koPtRegular18white(),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '앱 시스템',
                        style: AppTextStyle.koPtSemiBold24(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColor.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '버전',
                                    style: AppTextStyle.koPtRegular18white(),
                                  ),
                                  Text(
                                    '1.0.0',
                                    style: AppTextStyle.koPtRegular18white(),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                indent: 7,
                                endIndent: 7,
                                color: AppColor.white,
                              ),
                              GestureDetector(
                                child: Text(
                                  '로그아웃',
                                  style: AppTextStyle.koPtRegular18white(),
                                ),
                                onTap: () => Get.dialog(AppDialogs(
                                    textBold: '로그아웃',
                                    style: AppTextStyle.koPtBold16(),
                                    textRegular: '을 하시겠습니까?',
                                    cancelText: '아니오',
                                    onConfirm: () => controller.logout(),
                                    onCancel: () => Get.back(),
                                    confirmText: '네')),
                              ),
                              const Divider(
                                thickness: 1,
                                indent: 7,
                                endIndent: 7,
                                color: AppColor.white,
                              ),
                              GestureDetector(
                                child: Text(
                                  '회원탈퇴',
                                  style: AppTextStyle.koPtRegular18white(),
                                ),
                                onTap: () =>
                                    Get.toNamed(MembershipWithdrawalPage.route),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(color: AppColor.black),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
