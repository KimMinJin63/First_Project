import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:first_project/view/widget/app_category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AppCategoryButton extends StatelessWidget {
  const AppCategoryButton({super.key, required this.category, this.onPressed, });
  final String category;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width/3.7,
        height: MediaQuery.of(context).size.height/7,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.black,
                textStyle: AppTextStyle.koPtSemiBold20white()),
                // onPressed: Get.offNamed(page,arguments: Get.find<MainScreen>().),
            onPressed: onPressed,
            child: Text(category, textAlign: TextAlign.center,)),
      ),
    );
  }
}
