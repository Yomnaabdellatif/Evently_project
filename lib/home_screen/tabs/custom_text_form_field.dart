import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Color borderColor;
  Color iconColor;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? labelText;
  String? hintText;
bool? obscureText;

  CustomTextFormField({
    this.obscureText,
     this.hintStyle,
    this.borderColor=AppColors.gray,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor=AppColors.gray,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: "*",
      obscureText:obscureText ??false,


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
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color:AppColors.red ))
        ,
        disabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:borderColor ))

        ,


      ),
    );
  }
}
