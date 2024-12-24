import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Widget? icon;
  String buttonLabel;
  TextStyle? labelStyle;
  Color backgroundColor;
Function onClick;
  CustomElevatedButton({
    this.backgroundColor=AppColors.primaryLight,
    this.labelStyle,
    required this.buttonLabel,
 this.icon,
    required this.onClick
   });

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return ElevatedButton(onPressed: (){
      onClick();
    },
        style: ElevatedButton.
    styleFrom(backgroundColor:backgroundColor,elevation: 0,
            disabledBackgroundColor: AppColors.transparent,overlayColor:AppColors.transparent
            ,padding: EdgeInsets.symmetric(vertical: height*((25)/840)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.primaryLight)
        ) ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
    children: [
      icon?? SizedBox(),
      SizedBox(width: width*0.01,),
      Text(buttonLabel,style:labelStyle ?? AppStyles.semi20White,)

        ],
    ));
  }
}
