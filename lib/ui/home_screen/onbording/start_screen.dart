
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../../auth/login/login_screen.dart';
import '../tabs/custom_elevated_button.dart';

class StartScreen extends StatefulWidget {
  static String routeName="startScreen";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {

    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    bool isLight= themeProvider.appTheme==ThemeMode.light;
    bool isEnglish= languageProvider.appLanguage=="en";


    return Scaffold(
      appBar: AppBar(title: Image.asset(AssetsManager.logoRow),centerTitle: true
        ,backgroundColor:
      isLight ? AppColors.white:AppColors.primaryDark
        ,),
      body: Container(margin: EdgeInsets.symmetric(horizontal:width*(16/393) ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.startImage),
            Row(children: [
              Text(AppLocalizations.of(context)!.language
                ,style: AppStyles.semi20primaryLight,),
              const Spacer(),
              Container(decoration:
              BoxDecoration(border: Border.all(width: 2,color: AppColors.primaryLight),
                  borderRadius:
                  BorderRadius.circular(16),color: AppColors.transparent),

                child: InkWell(onTap: (){
                  if(isEnglish){
                    languageProvider.changeLanguage("ar");
                  }
                  else{
                    languageProvider.changeLanguage("en");
                  }

                },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(AssetsManager.iconEnglishLanguage)
                      , Image.asset(AssetsManager.iconArabicLanguage)
                    ],),
                ),)


            ],),
            SizedBox(height: height*(18/841),),
            Row(children: [
              Text(AppLocalizations.of(context)!.theme
                  ,style: AppStyles.semi20primaryLight),
              const Spacer(),
              Container(decoration:
              BoxDecoration(border: Border.all(width: 2,color: AppColors.primaryLight),
                  borderRadius:
              BorderRadius.circular(16),color: AppColors.transparent),

                child: InkWell(onTap: (){
                  if(isLight){
                    themeProvider.changeTheme(ThemeMode.dark);
                  }
                  else{
                    themeProvider.changeTheme(ThemeMode.light);
                  }

                },
                  child: const Row(children: [
                     Icon(CupertinoIcons.sun_max,color: AppColors.primaryLight,),
                    Icon(CupertinoIcons.moon_fill,color: AppColors.primaryLight,),
                              ],),
                ),)


            ],),
            SizedBox(height: height*(28/841),),
            CustomElevatedButton(buttonLabel: AppLocalizations.of(context)!.let_us_start, onClick: onClick)


          ],),
      ),

      ) ;
  }

  onClick(){

    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }
}
