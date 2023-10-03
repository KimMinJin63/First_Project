import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
RxInt selectedIndex= 0.obs;
PageController pageController = PageController();

   navigationOnTap(int index) {
    selectedIndex.value = index; // value 추가
    pageController.jumpToPage(index);
  }
}