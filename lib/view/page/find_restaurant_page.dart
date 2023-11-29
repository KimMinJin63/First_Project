// import 'package:first_project/controller/station_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../util/app_color.dart';
// import '../widget/app_bar.dart';

// class FindRestaurantPage extends GetView<StationController> {
//   const FindRestaurantPage({super.key});
//   static const route = '/findRestaurant';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(30),
//         child: AppBars(title: '대중 교통 기준', color: AppColor.black),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: TextField(
//                 controller: controller.searchController,
//                 // onChanged: (){},
//                 decoration: InputDecoration(
//                     filled: true,
//                     fillColor: AppColor.darkgrey,
//                     hintText: '역, 정류장을 검색해주세요.',
//                     contentPadding: const EdgeInsets.all(20),
//                     border: InputBorder.none,
//                     suffixIconColor: Colors.black,
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           if (controller.findStation.value.isNotEmpty) {
//                             controller.findRestaurant();
//                           }
//                         },
//                         icon: const Icon(Icons.search))),
                        
//               ),
              

//             ),
//             Container(
//               child: Text('${controller.searchResults}'),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
