import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/korean_list_page.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<DistrictController> {
  const SearchScreen({super.key});
  static const route = '/searchScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: AppBars(title: '', color: AppColor.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/images/logo.jpeg',
                    height: MediaQuery.of(context).size.height / 5,
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 7 * 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColor.black),
                          child: Center(
                              child: Text('장소별 기준',
                                  style: AppTextStyle.koPtBold35white())),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 7 * 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColor.black),
                          child: Center(
                              child: Text(
                            '대중 교통 기준',
                            style: AppTextStyle.koPtBold35white(),
                          )),
                        ),
                      )
                    ],
                  )
                  // ListView.separated(
                  //     itemCount: 2,
                  //     separatorBuilder: (context, index) {
                  //       return SizedBox(
                  //         height: 30,
                  //       );
                  //     },
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {},
                  //         child: Container(
                  //           height: MediaQuery.of(context).size.height / 5,
                  //           decoration: BoxDecoration(
                  //               color: AppColor.black,
                  //               borderRadius: BorderRadius.circular(10)),
                  //         ),
                  //       );
                  //     })
                  // GridView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: 2,
                  //     padding: EdgeInsets.only(left: 30, right: 30),
                  //     gridDelegate:
                  //          SliverGridDelegateWithFixedCrossAxisCount(
                  //           childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height /4),
                  //             crossAxisCount: 1,
                  //             mainAxisSpacing: 50),
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {},
                  //         child: Container(
                  //             decoration: BoxDecoration(
                  //                 color: AppColor.black,
                  //                 borderRadius: BorderRadius.circular(7)),
                  //             ),
                  //       );
                  //     }),
                  // ),
                ],
              ),
            )
          ]),
        ));
  }
}
