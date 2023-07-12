import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppDialogOnly extends StatelessWidget {
  const AppDialogOnly(
      {super.key, required this.textBold, required this.textRegular, required this.buttonText, this.onPressed, this.style});
  final String textBold;
  final TextStyle? style;
  final String textRegular;
  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16,32,16,32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: textBold,
                    style: style,
                  ),
                  TextSpan(
                    text: textRegular, 
                    style: AppTextStyle.koPtRegular16(),
                    )
                ])),
                const SizedBox(
                  height: 35,
                ),
                AppButton(
                  onPressed: onPressed,
                  name: buttonText, color: AppColor.black)
          ],
        ),
      ),
    );
  }
}
