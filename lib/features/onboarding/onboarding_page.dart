import 'dart:math';

import 'package:financy_app/common/widgets/MultiTextButton.dart';
import 'package:flutter/material.dart';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget{
  const OnboardingPage({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            Expanded(
              child: 
                Container(
                  color:AppColors.iceWhite,
                  child: Image.asset("assets/images/Brazuca Browsing.png"),
                ),
            ),
            Container(
              color:AppColors.white,
            ),
            Text('Spend Smarter',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLighTwo),
            ),  
            Text('Save More!',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLighTwo),
            ),  
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                text: 'Get Started',
                onPressed: (){},
                ),
            ),
            MultiTextButton(
              children: [
                Text('Already Have Account?',
                  style: AppTextStyles.mediumText18.copyWith(
                  color: AppColors.grey
                  ),
                ),
                 Text(' Log in',
                  style: AppTextStyles.mediumText18.copyWith(
                  color: AppColors.greenLighTwo
                  ),
                ), 
              ],
              onPressed: () => debugPrint('message'),
            ),
            SizedBox(height: 40.0,)
          ],

            ),
      ),
    );
  }
}
