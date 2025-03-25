
import 'package:financy_app/common/widgets/multi_text_button.dart';
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
                //color: AppColors.iceWhite,
                child: Image.asset(
                  "assets/images/tickIcon.png",
                  width: 250,  // Defina um tamanho fixo
                  height: 200, // Defina um tamanho fixo
                ),
              ),
            ),
            Container(
              color:AppColors.white,
            ),
            Text('Welcome!',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLighTwo),
            ),  
            Text('We help you analyze tick tests!',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLighTwo),
            ),  
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                text: 'Get Started',
                onPressed: (){
                  Navigator.pushNamed(context, '/SignUp');
                },
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
              onPressed: () {
                debugPrint('Log in clicked');
                Navigator.pushNamed(context, '/HomePage');
              },
            ),
            SizedBox(height: 40.0,)
          ],
        ),
      ),
    );
  }
}
