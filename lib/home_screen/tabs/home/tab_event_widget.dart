import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  String eventName;
  bool isSelected;
   TabEventWidget({required this.eventName,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width*0.025,vertical: height*0.005),
      decoration:
      BoxDecoration(color: isSelected? AppColors.white:
          AppColors.transparent,
          border: Border.all(color: AppColors.white,),
          borderRadius: BorderRadius.circular(46)),
      child: Text(eventName,style: isSelected ?
      AppStyles.semi16primaryLight:
      AppStyles.semi16White),


    );
  }
}
