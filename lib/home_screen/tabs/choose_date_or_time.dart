import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_styles.dart';

class ChooseDateOrTime extends StatelessWidget {
  String eventDateOrTime;
  IconData icon;
  String chooseEventDateOrTime;
  Function   onChooseDateOrTime;
TextStyle? textStyle;
Color iconColor;

  ChooseDateOrTime({
    required this.eventDateOrTime,
    required this.icon,
    required this.chooseEventDateOrTime,
    required this.onChooseDateOrTime,
    required this.textStyle,
    required this.iconColor


  });


  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return  Row(children:
    [
      Icon(icon,color:iconColor ,),
      SizedBox(width: width*(14/393),),
      Expanded(child: Text(eventDateOrTime,
        style:textStyle
        ,)),
      TextButton(onPressed: (){
         onChooseDateOrTime();
      }, child: Text(chooseEventDateOrTime,style: AppStyles.semi16primaryLight,))


    ],)
    ;
  }}

