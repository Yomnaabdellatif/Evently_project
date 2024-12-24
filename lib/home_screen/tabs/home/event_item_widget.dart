import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_theme_provider.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      height: height*(214/840),
      margin: EdgeInsets.symmetric(
          vertical: height*0.01,
          horizontal: width*(16/393)),

      decoration:
      BoxDecoration(image:DecorationImage(image:AssetImage(AssetsManager.sports),
          fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight)
      ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
        margin:  EdgeInsets.symmetric(vertical: height*(0.005),horizontal: width*0.009),
      padding: EdgeInsets.symmetric(vertical: height*(0.001),horizontal: width*0.02) ,
      decoration:
    BoxDecoration(color:themeProvider.appTheme==ThemeMode.light ? AppColors.white:AppColors.primaryDark,
      borderRadius: BorderRadius.circular(16),

    ),

      child: Column(
      children: [
        Text("21",style: AppStyles.bold20primaryLight,),
        Text("Nov",style: AppStyles.bold20primaryLight,),

      ],
    ),),
        Container(height: height*0.05,
        margin:  EdgeInsets.symmetric(vertical: height*(0.01),horizontal: width*0.01),
        padding: EdgeInsets.symmetric(vertical: height*(0.001),horizontal: width*0.02) ,
        decoration:
        BoxDecoration(
          color:themeProvider.appTheme==ThemeMode.light ? AppColors.white:AppColors.primaryDark,
          borderRadius: BorderRadius.circular(8),

        ),

        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child:

            Text("Meeting for Updating The Development Method ",style:
            themeProvider.appTheme==ThemeMode.light ?
            AppStyles.bold14Black:AppStyles.bold14White
            ))
            ,Image.asset(AssetsManager.iconLove,color: AppColors.primaryLight,)

          ],
        ),)],),

    );
  }
}
