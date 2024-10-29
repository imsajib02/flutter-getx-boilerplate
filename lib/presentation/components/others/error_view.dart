import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/localization_constants.dart';
import '../../../core/extensions/sized_box_extension.dart';
import '../../../core/styles/text_styles.dart';
import '../buttons/primary_button.dart';

class ErrorView extends StatelessWidget {

  final String errorMessage;
  final Function() onBtnPressed;

  const ErrorView({Key? key, required this.onBtnPressed, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade50,
                image: const DecorationImage(
                  image: AssetImage('assets/images/robot_oops.png'),
                ),
              ),
            ),

            40.h,

            Text(strOops.tr,
              style: TextStyles.errorStyle.copyWith(
                fontSize: 30,
              ),
            ),

            10.h,

            Text(errorMessage,
              style: TextStyles.alertStyle,
            ),

            30.h,

            PrimaryButton(
              buttonText: strTryAgain.tr,
              onTap: onBtnPressed,
            ),
          ],
        ),
      ),
    );
  }
}