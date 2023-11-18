import 'package:first_project/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
 
class AppBottomNavigate extends StatelessWidget {
  const AppBottomNavigate({super.key, required this.selectIndex, this.ontap});
  final int selectIndex;
  final Function(int index)? ontap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type:BottomNavigationBarType.fixed,
      currentIndex: selectIndex,
      selectedItemColor: AppColor.yellow,
      backgroundColor: AppColor.black,
      unselectedItemColor: AppColor.white,
      onTap: ontap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: '식당'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '위치'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜' ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지')
      ],
    );
  }
}
