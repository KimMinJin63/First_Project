import 'package:first_project/model/district.dart';
import 'package:first_project/model/message.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.message, required this.district});

  final Message message;
  final List<String> district;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(message.myInfo.name, style: AppTextStyle.koPtSemiBold20white()),
              ],
            ),
            Text(message.content, style: TextStyle(color: Colors.white),),
            Text(DateFormat("yyyy.MM.dd").format(message.sendDate), style: AppTextStyle.koPtRegular16white()),
          ],
        ),
      ),
    );
  }
}
