import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/model/district.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/page/korean_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCategoryList extends StatelessWidget {
  const AppCategoryList({super.key, required this.category, required this.district});
  final String category;
  final String district;

  Future<List<District>> fetchRestaurant() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(district) // 'restaurants'를 컬렉션 이름으로 변경해주세요.
        .where('category', isEqualTo: category)
        .get();

    return snapshot.docs.map((doc) => District.fromSnapshot(doc)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/logo.jpeg',
                height: MediaQuery.of(context).size.height / 5,
              )),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: FutureBuilder<List<District>>(
                  future: fetchRestaurant(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error fetching categories: ${snapshot.error}');
                    } else {
                      List<District> restaurants = snapshot.data!;
                      return ListView.builder(
                        itemCount: restaurants.length,
                        itemBuilder: (context, index) {
                          String name = restaurants[index]
                              .name; // Use the 'name' property of the District object
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                              KoreanListPage.route,
                              arguments: name,
                            ),
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                color: AppColor.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  name,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.koPtSemiBold20white(),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
  }
}