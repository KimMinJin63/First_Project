import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
RxInt selectedIndex= 0.obs;
PageController pageController = PageController();

  void NavigationOnTap(int index) {
    selectedIndex(index);
    pageController.jumpToPage(selectedIndex.value);
  }
}