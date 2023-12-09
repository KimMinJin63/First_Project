import 'package:first_project/util/app_color.dart';
import 'package:flutter/material.dart';

class AppPageIndicator extends StatefulWidget {
  final int currentPage;
  final int pageCount;
  final PageController pageController;

  const AppPageIndicator({
    required this.currentPage,
    required this.pageCount,
    required this.pageController,
  });

  @override
  _AppPageIndicatorState createState() => _AppPageIndicatorState();
}

class _AppPageIndicatorState extends State<AppPageIndicator> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    // 현재 페이지가 5페이지 이상일 때만 '이전' 버튼 추가
    if (widget.currentPage > 4) {
      children.add(
        SizedBox(
          width: 50,
          child: TextButton(
            onPressed: () {
              widget.pageController.animateToPage(
                (widget.currentPage ~/ 5) * 5 - 5,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              '이전',
              style: TextStyle(
                color: widget.currentPage - 1 == (widget.currentPage ~/ 5) * 5 - 5
                    ? AppColor.red
                    : AppColor.black,
              ),
            ),
          ),
        ),
      );
    }

    // 현재 페이지를 기준으로 페이지 표시 범위 계산
    int startPage = (widget.currentPage ~/ 5) * 5 + 1;
    int endPage = (startPage + 4).clamp(1, widget.pageCount);

    for (int i = startPage; i <= endPage; i++) {
      children.add(
        SizedBox(
          width: 42,
          child: TextButton(
            onPressed: () {
              // 현재 페이지가 마지막 페이지이면 '다음' 버튼을 눌러도 아무 동작 안 함
              if (i <= widget.pageCount) {
                widget.pageController.animateToPage(
                  i - 1,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                );
                // 페이지를 변경하면서 선택된 페이지를 업데이트
                setState(() {
                  widget.currentPage;
                });
              }
            },
            child: Text(
              i.toString(),
              style: TextStyle(
                fontSize: 14,
                color: i == widget.currentPage + 1 ? AppColor.red : AppColor.black,
                fontWeight: i == widget.currentPage + 1 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }

    // 현재 페이지가 마지막에서 5페이지 전까지인 경우에만 '다음' 버튼 추가
    if (widget.currentPage < widget.pageCount - 4) {
      children.add(
        SizedBox(
          width: 50,
          child: TextButton(
            onPressed: () {
              widget.pageController.animateToPage(
                endPage,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
              // 페이지를 변경하면서 선택된 페이지를 업데이트
              setState(() {
                widget.currentPage;
              });
            },
            child: Text(
              '다음',
              style: TextStyle(
                color: endPage == widget.currentPage + 1 ? AppColor.red : AppColor.black,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
