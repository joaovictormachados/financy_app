import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/constants/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/constants/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_password_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

 class SignUpPage extends StatefulWidget{
  
  const SignUpPage({
    super.key
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
  children: [
    Expanded(
      child: ListView(
        children: [
          Text(
            "Register",
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.darkGrey
            ),
            textAlign: TextAlign.center,
          ),
          // Text(
          //   "Save More",
          //   style: AppTextStyles.mediumText.copyWith(
          //     color: AppColors.greenLighTwo
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          Image.asset("assets/images/Stuck at Home To Do List.png"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "Enter your name here",
                  labelText: "Your Name",
                  textInputAction: TextInputAction.next,
                  inputFormatters: [UpperCaseTextInputFormatter(),
                  ],
                  validator: Validator.validateName,
                ),

                CustomTextFormField(
                  hintText: "Enter your email here",
                  labelText: "Your Email",
                  textInputAction: TextInputAction.next,
                  validator: Validator.validateEmail,
                ),

                CustomPasswordFormField(
                  labelText: "Enter your password",
                  hintText: "Password",
                  helperText: "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character.",
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                ),
                CustomPasswordFormField(
                  labelText: "Confirm your password",
                  hintText: "Password",
                  validator: (value) => Validator.validateConfirmPassword(value,_passwordController.text),
                 
                ),
              ],
            ),
          ),
        ],
      ),
    ),

      /// Botões alinhados na parte inferior
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10.0,
          children: [
            Text('By selecting Sign Up, I agree to Dynamic Layers Terms of Service, Payments Terms of Service and Notification Policy and acknowledge the Privacy Policy.',
                 textAlign: TextAlign.justify,
                 style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
                 ),
            PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState?.validate();
                log(valid.toString());

                debugPrint('Clicou em signup');
                if (valid == true) {Navigator.pushNamed(context, '/HomePage');}

                //Navigator.pushNamed(context, "/HomePage");
              },
            ),
            // Espaço entre os botões
            MultiTextButton(
              children: [
                Text(
                  'Already Have Account?',
                  style: AppTextStyles.mediumText18.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  ' Log in',
                  style: AppTextStyles.mediumText18.copyWith(
                    color: AppColors.greenLighTwo,
                  ),
                ),
              ],
              onPressed: () => debugPrint('message'),
            ),
          ],
        ),
      ),
    ],
  ),
        
      
    ),
    );
  }

}
