import 'package:first_project/model/message.dart';
import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.white,
                backgroundImage: message.myInfo.photoUrl != null
                ?NetworkImage(message.myInfo.photoUrl.toString())
                :null
              ),
              Text(message.myInfo.name, style: AppTextStyle.koPtSemiBold20white(),)
            ],
          ),
          Text(message.content),
          Text(DateFormat("yyyy.MM.dd HH시 mm분").format(message.sendDate), style: AppTextStyle.koPtRegular16white(),)

        ],
      ),
    );
  }
}