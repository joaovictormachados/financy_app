import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget{
  const SplashPage ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: 
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors:AppColors.greenGradient,
            ),
          ),
          child: Text(
                  "Tick App",
                  style: AppTextStyles.bigText.copyWith(color: AppColors.white),
                ),
        ),
    );
  
  }
}