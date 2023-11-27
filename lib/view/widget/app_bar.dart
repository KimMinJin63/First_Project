import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';



class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({super.key, required this.title, required this.color, this.home});

  final String title;
  final Color color;
  final VoidCallback? home;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: AppTextStyle.koPtBold27()),
        backgroundColor: Colors.transparent,
        foregroundColor: color,
        elevation: 0,
        actions: home != null
            ? [
                IconButton(
                  onPressed: home,
                  icon: const Icon(Icons.home),
                ),
              ]
            : null,
      ),
    );
  }
}
