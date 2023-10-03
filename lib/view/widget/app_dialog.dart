import 'package:first_project/util/app_color.dart';
import 'package:first_project/util/app_textstyle.dart';
import 'package:first_project/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppDialogs extends StatelessWidget {
  const AppDialogs(
      {super.key,
      required this.textBold,
      required this.textRegular,
      this.style,
      required this.cancelText,
      required this.confirmText,
      this.onCancel,
      this.onConfirm});
  final String textBold;
  final TextStyle? style;
  final String textRegular;
  final String cancelText;
  final String confirmText;
  final Function()? onCancel;
  final Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3 * 1,
                    child: AppButton(
                        onPressed: onCancel,
                        style: AppTextStyle.koPtRegular16white(),
                        name: cancelText,
                        color: AppColor.black),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3 * 1,
                    child: AppButton(
                        onPressed: onConfirm,
                        style: AppTextStyle.koPtRegular16white(),
                        name: confirmText,
                        color: AppColor.black),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
