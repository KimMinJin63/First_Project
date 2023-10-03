import 'package:first_project/util/app_color.dart';
import 'package:flutter/material.dart';

class AppPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final PageController pageController;

  const AppPageIndicator({
    required this.currentPage,
    required this.pageCount,
    required this.pageController,
  });

 @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          child: TextButton(
            onPressed: currentPage > 0
                ? () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                : null,
            child: Text('이전', style: TextStyle(color: AppColor.black),),
          ),
        ),
        for (int i = 0; i < pageCount; i++)
          if (i == 0 || i == pageCount - 1 || (currentPage - i).abs() < 3)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: SizedBox(
                width: 35,
                child: TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    (i + 1).toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.black,
                      fontWeight: i == currentPage
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
          else if (i == 1 || i == pageCount - 2)
            Text('...', style: TextStyle(fontSize: 14)),
        SizedBox(
          width: 45,
          child: TextButton(
            onPressed: currentPage < pageCount - 1
                ? () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                : null,
            child: Text('다음',style: TextStyle(color: AppColor.black)),
          ),
        ),
      ],
    );
  }  
  }
