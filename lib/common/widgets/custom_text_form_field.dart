
import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>?  validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;

  const CustomTextFormField({
    super.key, 
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.textInputAction, 
    this.suffixIcon,
    this.obscureText,
    this.validator, 
    this.inputFormatters, this.helperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greenLighTwo),
  );

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  
  String? _helperText;

  @override
  void initState(){
    log("Init state called");
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12
        ),
      child: TextFormField(
        onChanged: (value) {
          if (value.length ==1) {
            setState(() {
              _helperText = null;
            });
          }
          else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        textCapitalization:widget.textCapitalization ?? TextCapitalization.words,
        controller: widget.controller,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          hintText: widget.hintText,
          labelText: widget.labelText?.toUpperCase(),
          suffix: widget.suffixIcon,
          labelStyle: AppTextStyles.inputText.copyWith(color: AppColors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder:defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red),
          ),  
          focusedErrorBorder:defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red),
          ),      
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder      
        ),
      ),
    );
  }
}   