import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppCategoryButton extends StatelessWidget {
  const AppCategoryButton({
    super.key,
    required this.category,
    this.onPressed,
  });
  final String category;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            width: MediaQuery.of(context).size.width / 3.8,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
                color: AppColor.black, borderRadius: BorderRadius.circular(10)),
            // style: ElevatedButton.styleFrom(

            //     backgroundColor: AppColor.black,
            //     textStyle: AppTextStyle.koPtSemiBold20white()),
            //     // onPressed: Get.offNamed(page,arguments: Get.find<MainScreen>().),
            // onPressed: onPressed,
            child: Center(
                child: Text(
              category,
              textAlign: TextAlign.center,
              style: AppTextStyle.koPtSemiBold20white(),
            ))),
      ),
    );
  }
}
