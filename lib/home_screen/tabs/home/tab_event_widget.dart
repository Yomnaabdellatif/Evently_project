import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  String eventName;
  bool isSelected;
  Color backgroundColor;
  TextStyle textSelectedStyle;
  TextStyle textUnSelectedStyle;

  TabEventWidget({
    required this.eventName,
    required this.isSelected,
    required this.backgroundColor,
    required this.textSelectedStyle,
    required this.textUnSelectedStyle

   });

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width*0.025,vertical: height*0.005),
      decoration:
      BoxDecoration(color: isSelected? backgroundColor:
          AppColors.transparent,
          border: Border.all(color: backgroundColor,),
          borderRadius: BorderRadius.circular(46)),
      child: Text(eventName,style: isSelected ? textSelectedStyle
      :textUnSelectedStyle
      ),


    );
  }
}
