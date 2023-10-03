import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        Wrap(children: [
          Text(
            detail,
            style: AppTextStyle.koPtRegular16white(),
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
          ),
        ])
      ],
    );
  }
}
