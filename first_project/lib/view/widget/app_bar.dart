import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: AppTextStyle.koPtRegular14()),
        backgroundColor: Colors.transparent,
        foregroundColor: color,
        elevation: 0,
      ),
    );
  }
}