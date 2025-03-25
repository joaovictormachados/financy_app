import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget{

  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final FormFieldValidator <String>? validator;
  final String? helperText;

  const CustomPasswordFormField ({
    super.key,
    this.controller, 
    this.padding, 
    this.hintText, 
    this.labelText, 
    this.suffixIcon,
    this.validator, 
    this.helperText,
  }
    
  );
  @override
  State<CustomPasswordFormField> createState() => _CustomPasswordFormField();

}
class _CustomPasswordFormField extends State<CustomPasswordFormField> {

  bool isHiden = true;
  
  @override
  Widget build(BuildContext  context) {
    return CustomTextFormField( 
      validator: widget.validator,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      obscureText: isHiden,
      helperText: widget.helperText,
      suffixIcon: InkWell(
        onTap: () {
          debugPrint("eye icon pressed");
          setState(() {
            isHiden = !isHiden;
            
          });
        },
        child: Icon(isHiden ? Icons.visibility : Icons.visibility_off),

        ),
    );
  }
}