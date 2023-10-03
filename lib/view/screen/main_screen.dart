import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/bar_list_page.dart';
import 'package:first_project/view/page/category_restaurant_page.dart';
import 'package:first_project/view/page/chinese_list_page.dart';
import 'package:first_project/view/page/coffee_list_page.dart';
import 'package:first_project/view/page/dessert_list_page.dart';
import 'package:first_project/view/page/fusion_list_page.dart';
import 'package:first_project/view/page/japanese_list_page.dart';
import 'package:first_project/view/page/korean_list_page.dart';
import 'package:first_project/view/page/western_list_page.dart';
import 'package:first_project/view/page/world_list_page.dart';
import 'package:first_project/view/widget/app_bar.dart';
import 'package:first_project/view/widget/app_category_button.dart';
import 'package:first_project/view/widget/app_district.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class MainScreen extends GetView{
//   const MainScreen({super.key});
//   static const route = '/mainScreen';

// Future<List<String>> fetchcategories(String district) async {
//   // Firestore에서 해당 지역의 category 값을 불러와 Set<String>으로 변환하여 중복 제외
//   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(district).get();
//   Set<String> categoriesSet = snapshot.docs.map((doc) => doc.get('category') as String).toSet();
//   // Set을 다시 List로 변환하여 반환
//   return categoriesSet.toList();
// }

//   @override
//   Widget build(BuildContext context) {
//     final selectedDistrict = Get.arguments as String;
//     // ];
//     return Scaffold(
//       appBar:  PreferredSize(
//         preferredSize: Size.fromHeight(30),
//         child: AppBars(title: '$selectedDistrict', color: AppColor.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//                 child: Image.asset(
//               'assets/images/logo.jpeg',
//               height: MediaQuery.of(context).size.height / 5,
//             )),
//             const SizedBox(
//               height: 70,
//             ),
//             Expanded(
//               child: FutureBuilder<List<String>>(
//                 future: fetchcategories(selectedDistrict),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text(
//                         'Error fetching FD_CS values: ${snapshot.error}');
//                   } else {
//                     List<String> categoryValues = snapshot.data ?? [];
//                     return GridView.builder(
//                       itemCount: categoryValues.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 25,
//                         mainAxisSpacing: 25,
//                       ),
//                       itemBuilder: (context, index) {
//                         String categoryValue = categoryValues[index];
//                         return GestureDetector(
//                           onTap: () => Get.toNamed(KoreanListPage.route,
//                               arguments: categoryValue),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppColor.black,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 categoryValue,
//                                 textAlign: TextAlign.center,
//                                 style: AppTextStyle.koPtSemiBold20white(),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class MainScreen extends GetView {
  const MainScreen({super.key});
  static const route = '/mainScreen';

  // @override
  // Widget build(BuildContext context) {
  //   final selectedDistrict = Get.arguments;

  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: const Size.fromHeight(30),
  //       child: AppBars(title: '$selectedDistrict', color: AppColor.black),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Center(
  //               child: Image.asset(
  //             'assets/images/logo.jpeg',
  //             height: MediaQuery.of(context).size.height / 5,
  //           )),
  //           const SizedBox(
  //             height: 70,
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   AppCategoryButton(
  //                       category: '한식',
  //                       onPressed: () => Get.toNamed(KoreanListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                   AppCategoryButton(
  //                       category: '중식',
  //                       onPressed: () => Get.toNamed(ChineseListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                   AppCategoryButton(
  //                       category: '일식',
  //                       onPressed: () => Get.toNamed(JapaneseListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   AppCategoryButton(
  //                       category: '양식',
  //                       onPressed: () => Get.toNamed(WesternListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                   AppCategoryButton(
  //                       category: '디저트/\n베이커리',
  //                       onPressed: () => Get.toNamed(DessertListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                   AppCategoryButton(
  //                       category: '특별한\n술집',
  //                       onPressed: () => Get.toNamed(BarListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   AppCategoryButton(category: '세계요리',
  //                       onPressed: () => Get.toNamed(WorldListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                   AppCategoryButton(category: '퓨전\n뷔페',
  //                       onPressed: () => Get.toNamed(FusionListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                   AppCategoryButton(category: '전통차/\n커피',
  //                       onPressed: () => Get.toNamed(CoffeeListPage.route,
  //                           arguments: '$selectedDistrict')),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: Text('어디의 맛집을 찾고계신가요?', style: AppTextStyle.koPtBold27()),
            )),
            AppDistrict('중구', '중구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=중구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('동구', '동구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=동구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('서구', '서구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=서구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('남구', '남구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=남구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('북구', '북구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=북구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('수성구', '수성구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=수성구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('달서구', '달서구',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=달서구',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
            AppDistrict('달성군', '달성군',
                'https://daegufood.go.kr/kor/api/tasty.html?mode=json&addr=달성군',
                (selectedDistrict) {
              Get.toNamed(CategoryRestaurantPage.route,
                  arguments: selectedDistrict);
            }),
          ],
        )),
      ),
    );
  }
}
