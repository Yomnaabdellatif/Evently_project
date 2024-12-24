import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_project/home_screen/language_bottom_sheet.dart';
import 'package:evently_project/home_screen/theme_bottom_sheet.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';

class ProfileTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    var themeProvider= Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
        title: Row(children: [Image.asset(AssetsManager.profileImage),SizedBox(width: width*0.01,),
        Column(children: [Text("Route ",style: AppStyles.bold24White,),Text("route@gmail.com",style: AppStyles.semi16White,)],)],),
        toolbarHeight: height*0.2,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))),),
      body: Padding(
        padding:  EdgeInsets.all(height * 0.02),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,style: AppStyles.bold20Black,),
            InkWell(
              onTap: (){
                showLanguageBottomSheet( context);
              },
              child: Container(
                margin:EdgeInsets.all(height * 0.01)
                ,decoration: BoxDecoration(border: Border.all(color: AppColors.primaryLight),borderRadius: BorderRadius.circular(16)),
                child:
                Padding(
                  padding:  EdgeInsets.all(height * 0.01),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(languageProvider.appLanguage =="en" ?
                      AppLocalizations.of(context)!.english
                          :
                      AppLocalizations.of(context)!.arabic

                        ,style: AppStyles.bold20primaryLight,)
                      ,Icon(Icons.arrow_drop_down_sharp,color: AppColors.primaryLight,)],),
                )
                ,),
            ),

            SizedBox(height: height*0.05,),
            Text(AppLocalizations.of(context)!.theme
              ,style: AppStyles.bold20Black,),
            InkWell(
              onTap: (){
                showThemeBottomSheet( context);
              },
              child: Container(
                margin:EdgeInsets.all(height * 0.01)
                ,decoration: BoxDecoration(border: Border.all(color: AppColors.primaryLight),borderRadius: BorderRadius.circular(16)),
                child:
                Padding(
                  padding:  EdgeInsets.all(height * 0.01),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(themeProvider.isDarkMode()?
                      AppLocalizations.of(context)!.dark
                          :
                      AppLocalizations.of(context)!.light


                        ,style: AppStyles.bold20primaryLight,)
                      ,Icon(Icons.arrow_drop_down_sharp,color: AppColors.primaryLight,)




                    ],),
                )
                ,),
            )

          ],),
      ),
    );
  }
  void showLanguageBottomSheet(BuildContext context) {

    showModalBottomSheet(context: context, builder: (context)=>LanguageBottomSheet());
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (context)=>ThemeBottomSheet());


  }
}
