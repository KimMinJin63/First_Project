// import 'package:first_project/controller/station_controller.dart';
// import 'package:first_project/model/district.dart';
// import 'package:first_project/util/app_textstyle.dart';
// import 'package:first_project/view/page/review_detail_page.dart';
// import 'package:first_project/view/widget/app_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../util/app_color.dart';
// import '../widget/app_bar.dart';

// class FindStationPage extends GetView<StationController> {
//   const FindStationPage({super.key});
//   static const route = '/findStation';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(30),
//         child: AppBars(title: '대중 교통 기준', color: AppColor.black),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: controller.searchController,
//                         autofocus: true,
//                         onChanged: (value) {
//                           controller.findStation.value = value;
//                           controller.findStations();
//                         },
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             onPressed: () async {
//                               print('----------작동1');
//                               print('검색어: ${controller.findStation.value}');
//                               controller.findStations();
//                               if (controller.findStation.value.isNotEmpty) {
//                                 print('=============작동2');
//                                 await controller.findStations();
//                               }
//                               print('=============작동3');
//                             },
//                             icon: const Icon(
//                               Icons.search,
//                               size: 20,
//                               color: Colors.black,
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           hintText: '장소, 지명을 검색해주세요.',
//                           contentPadding: const EdgeInsets.all(20),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Expanded(
//                 child: Obx(() {
//                   if (controller.findStation.value.isNotEmpty &&
//                       controller.searchResults.isEmpty &&
//                       !controller.isSearching.value) {
//                     return const SizedBox();
//                     // return Text(
//                     //   '일치하는 식당이 없습니다.',
//                     //   style: TextStyle(
//                     //     fontSize: 32,
//                     //     fontWeight: FontWeight.bold,
//                     //   ),
//                     //   textAlign: TextAlign.center,
//                     // );
//                   } else {
//                     return ListView.builder(
//                       itemCount: controller.searchResults.length,
//                       itemBuilder: (context, index) {
//                         final restaurant = controller.searchResults[index];
//                         return AppButton(
//                           name: restaurant.name ?? '식당 없음',
//                           onPressed: () {
//                             Get.toNamed(
//                               ReviewDetailPage.route,
//                               arguments: restaurant,
//                             );
//                           },
//                           color: AppColor.black,
//                           style: AppTextStyle.koPtRegular16white(),
//                         );
//                       },
//                     );
//                   }
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:first_project/controller/station_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/review_detail_page.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:first_project/view/widget/app_pageview.dart';
import 'package:first_project/view/widget/app_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_color.dart';
import '../widget/app_bar.dart';

class FindStationPage extends GetView<StationController> {
  const FindStationPage({super.key});
  static const route = '/findStation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('대중 교통 기준'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppTabBar(
              tabController: controller.tabController,
            )),
      ),
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(30),
      //   child: AppBars(title: '대중 교통 기준', color: AppColor.black),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            controller: controller.tabController,
            // onPageChanged: (int index) {
            //   if (index == 0) {
            //     controller.searchController2
            //         .clear(); // 첫 번째 탭으로 이동할 때 두 번째 탭의 TextField를 초기화
            //   } else {
            //     controller.searchController1
            //         .clear(); // 두 번째 탭으로 이동할 때 첫 번째 탭의 TextField를 초기화
            //   }
            // },
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.searchController1,
                            autofocus: true,
                            onChanged: (value) {
                              controller.findStation.value = value;
                              controller.findStations();
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  print('----------작동1');
                                  print('검색어: ${controller.findStation.value}');
                                  controller.findStations();
                                  if (controller.findStation.value.isNotEmpty) {
                                    print('=============작동2');
                                    await controller.findStations();
                                  }
                                  print('=============작동3');
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: '장소, 지명을 검색해주세요.',
                              contentPadding: const EdgeInsets.all(20),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Obx(() {
                      if (controller.findStation.value.isNotEmpty &&
                          controller.searchResults.isEmpty &&
                          !controller.isSearching.value) {
                        return const SizedBox();
                        // return Text(
                        //   '일치하는 식당이 없습니다.',
                        //   style: TextStyle(
                        //     fontSize: 32,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // );
                      } else {
                        return ListView.builder(
                          itemCount: controller.searchResults.length,
                          itemBuilder: (context, index) {
                            final restaurant = controller.searchResults[index];
                            return AppButton(
                              name: restaurant.name ?? '식당 없음',
                              onPressed: () {
                                Get.toNamed(
                                  ReviewDetailPage.route,
                                  arguments: restaurant,
                                );
                              },
                              color: AppColor.black,
                              style: AppTextStyle.koPtRegular16white(),
                            );
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.searchController2,
                            autofocus: true,
                            onChanged: (value) {
                              controller.findBusStation.value = value;
                              controller.findBusStations();
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  print('----------작동1');
                                  print('검색어: ${controller.findBusStation.value}');
                                  controller.findBusStations();
                                  if (controller.findBusStation.value.isNotEmpty) {
                                    print('=============작동2');
                                    await controller.findBusStations();
                                  }
                                  print('=============작동3');
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: '장소, 지명을 검색해주세요.',
                              contentPadding: const EdgeInsets.all(20),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Obx(() {
                      if (controller.findBusStation.value.isNotEmpty &&
                          controller.searchBusResults.isEmpty &&
                          !controller.isSearching.value) {
                        return const SizedBox();
                        // return Text(
                        //   '일치하는 식당이 없습니다.',
                        //   style: TextStyle(
                        //     fontSize: 32,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // );
                      } else {
                        return ListView.builder(
                          itemCount: controller.searchBusResults.length,
                          itemBuilder: (context, index) {
                            final restaurant = controller.searchBusResults[index];
                            return AppButton(
                              name: restaurant.name ?? '식당 없음',
                              onPressed: () {
                                Get.toNamed(
                                  ReviewDetailPage.route,
                                  arguments: restaurant,
                                );
                              },
                              color: AppColor.black,
                              style: AppTextStyle.koPtRegular16white(),
                            );
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
