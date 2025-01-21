import 'package:evently_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../../utilities/app_styles.dart';


class ThemeBottomSheet extends StatefulWidget {


  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var themeProvider= Provider.of<AppThemeProvider>(context);
    return Padding(
      padding:  EdgeInsets.all(height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(onTap: (){
            themeProvider.changeTheme(ThemeMode.light);

          },
            child:
            !themeProvider.isDarkMode() ?
            getSelectedItemWidget(AppLocalizations.of(context)!.light)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
            ,

          )
          ,SizedBox(height: height*0.02,)
          ,InkWell(onTap: (){
           themeProvider.changeTheme(ThemeMode.dark);
          },
            child:
            themeProvider.isDarkMode() ?
            getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
            ,


          )


        ],),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.bold20primaryLight),
        Icon(Icons.check,color: AppColors.primaryLight,),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,style: AppStyles.bold20Black)
    ;
  }
}
