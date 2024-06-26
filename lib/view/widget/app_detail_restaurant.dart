import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppDetailRestaurant extends StatelessWidget {
  const AppDetailRestaurant({super.key, required this.detail, required this.detailName});
  final String detailName;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(detailName, style: AppTextStyle.koPtRegular16white()),
        Flexible(
          child: Text(
            detail,
            style: AppTextStyle.koPtRegular16white(),
            textAlign: TextAlign.left,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        )
      ],
    );
  }
}
