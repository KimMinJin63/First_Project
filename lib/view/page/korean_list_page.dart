// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_project/controller/district_controller.dart';
// import 'package:first_project/model/district.dart';
// import 'package:first_project/util/app_color.dart';
// import 'package:first_project/util/app_textstyle.dart';
// import 'package:first_project/view/page/detail_restaurant_page.dart';
// import 'package:first_project/view/widget/app_bar.dart';
// import 'package:first_project/view/widget/app_category_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class KoreanListPage extends GetView<DistrictController> {
//   static const route = '/korean';

//   Future<List<District>> fetchRestaurant(
//       String district, String category) async {
//     final snapshot = await FirebaseFirestore.instance
//         .collection(district) // Change 'restaurants' to your collection name
//         .where('category', isEqualTo: category)
//         .get();

//     return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final categoryValues = Get.arguments as String;
//     final selectedDistrict = Get.arguments as String;

//     return Scaffold(
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(30),
//           child: AppBars(title: '한식', color: AppColor.black),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                   child: Image.asset(
//                 'assets/images/logo.jpeg',
//                 height: MediaQuery.of(context).size.height / 5,
//               )),
//               const SizedBox(
//                 height: 70,
//               ),
//               Expanded(
//                 child: FutureBuilder<List<District>>(
//                   future: fetchRestaurant(selectedDistrict, categoryValues),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const CircularProgressIndicator();
//                     } else if (snapshot.hasError) {
//                       return Text('Error fetching categories: ${snapshot.error}');
//                     } else {
//                       List<District> restaurants = snapshot.data!;
//                       return ListView.builder(
//                         itemCount: restaurants.length,
//                         itemBuilder: (context, index) {
//                           String name = restaurants[index]
//                               .name; // Use the 'name' property of the District object
//                           return GestureDetector(
//                             onTap: () => Get.toNamed(
//                               DetailRestaurantPage.route,
//                               arguments: name,
//                             ),
//                             child: Container(
//                               height: 55,
//                               decoration: BoxDecoration(
//                                 color: AppColor.black,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   name,
//                                   textAlign: TextAlign.center,
//                                   style: AppTextStyle.koPtSemiBold20white(),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/detail_restaurant_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class KoreanListPage extends GetView<DistrictController> {
  const KoreanListPage({super.key});
  static const route = '/korean';

  @override
  Widget build(BuildContext context) {
    final selectedDistrict = Get.arguments;
   

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBars(title: '한식', color: AppColor.black, home: () => Get.offAllNamed(MainPage.route)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/images/logo.jpeg',
                height: MediaQuery.of(context).size.height / 5,
              ),
            )),
            const SizedBox(
              height: 70,
            ),
            Expanded(
              child: FutureBuilder<List<District>>(
                future: controller.findRestaurant('$selectedDistrict', '한식'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'SORRY\n식당이 없습니다ㅠㅠ',
                        style: AppTextStyle.koPtBold32(),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    List<District> restaurants = snapshot.data!;
                    int pages = (restaurants.length / 5).ceil();
                    PageController pageController = PageController();
                     int currentPageIndex = 0;

                    return PageView.builder(
                        controller: pageController,
                        itemCount: pages,
                        onPageChanged: (index) {
                          currentPageIndex = index;
                        },
                        itemBuilder: (context, pageIndex) {
                          int startIndex = pageIndex * 5;
                          int endIndex = (pageIndex + 1) * 5;
                          if (endIndex > restaurants.length) {
                            endIndex = restaurants.length;
                          }
                          List<District> pageItems =
                              restaurants.sublist(startIndex, endIndex);
                          return Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: pageItems.length,
                                    itemBuilder: (context, index) {
                                      String name = pageItems[index]
                                          .name; // Use the 'name' property of the District object
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: GestureDetector(
                                          onTap: () => Get.toNamed(
                                            DetailRestaurantPage.route,
                                            arguments: {'district': selectedDistrict, 'name': name,},
                                          ),
                                          child: Container(
                                            height: 55,
                                            decoration: BoxDecoration(
                                              color: AppColor.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                name,
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle
                                                    .koPtSemiBold20white(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(bottom: 16),
                                //   child: SmoothPageIndicator(
                                //     controller:pageController,
                                //     count: pages,
                                //     effect: const ScaleEffect(
                                //       activeDotColor: AppColor.black,
                                //       dotColor: AppColor.grey,
                                //       radius: 1,
                                //     ),
                                //     onDotClicked: (index) {
                                //       pageController.animateToPage(
                                //         index,
                                //         duration:
                                //             const Duration(milliseconds: 300),
                                //         curve: Curves.easeInOut,
                                //       );
                                //     },
                                //   ),
                                // )
                                
                                AppPageIndicator(
                                  currentPage: currentPageIndex,
                                  pageCount: pages,
                                  pageController: pageController,
                                )
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon:Icon(Icons.chevron_left)),]),
    );
  }
}
