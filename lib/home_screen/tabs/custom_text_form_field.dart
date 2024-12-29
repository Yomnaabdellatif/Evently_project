import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';
typedef MyValidator=String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  MyValidator validator;
  Color borderColor;
  Color iconColor;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? labelText;
  String? hintText;
bool? obscureText;
int? maxLines;
TextEditingController? controller;
  TextStyle? textStyle;

  // String? Function(String?)? validator;
  CustomTextFormField({
    this.controller,
    this.maxLines=1,
    this.obscureText,
    this.hintStyle,
    this.borderColor=AppColors.gray,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor=AppColors.gray,
    this.validator,
    this.textStyle,



  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:textStyle ,
      obscuringCharacter: "*",
      obscureText:obscureText ??false,
      maxLines: maxLines,
      validator: validator,
      controller: controller,

      decoration:
      InputDecoration(


        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.semi16Gray,
        labelText:labelText ,
        labelStyle: labelStyle ?? AppStyles.semi16Gray,
        prefixIcon:prefixIcon ,
        suffixIcon: suffixIcon,
        prefixIconColor: iconColor,
        suffixIconColor: iconColor,




        enabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:borderColor ))
        ,
        focusedBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:borderColor ))
        ,
        errorBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color:AppColors.red ))
        ,
        disabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:borderColor ))
        ,focusedErrorBorder:
      OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color:AppColors.red ))



      ),
    );
  }
}
