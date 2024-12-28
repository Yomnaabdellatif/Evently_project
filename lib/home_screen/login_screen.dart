import 'package:evently_project/home_screen/home_screen.dart';
import 'package:evently_project/home_screen/register_screen.dart';
import 'package:evently_project/home_screen/reset_password_screen.dart';
import 'package:evently_project/home_screen/tabs/custom_elevated_button.dart';
import 'package:evently_project/home_screen/tabs/custom_text_form_field.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_language_provider.dart';
import '../providers/app_theme_provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var languageProvider= Provider.of<AppLanguageProvider>(context);

    bool isLight= themeProvider.appTheme==ThemeMode.light;

    return Scaffold(
      backgroundColor: isLight
          ? AppColors.white:
      AppColors.primaryDark,

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height*(64/841),),
          padding:  EdgeInsets.symmetric(horizontal: width*(16/393), ),
          child: Column(
            children: [
            Image.asset(AssetsManager.logo,height: height*(186/841),),
            SizedBox(height:height*(16/841) ,),

            CustomTextFormField(hintText: AppLocalizations.of(context)!.email,
              hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
              prefixIcon:
              Image.asset(AssetsManager.iconEmail,color: isLight? AppColors.gray:AppColors.lightGray,),),
        
            SizedBox(height:height*(16/841) ,),
            CustomTextFormField(obscureText: true,
              hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon:
              Image.asset(AssetsManager.iconPassword,color: isLight? AppColors.gray:AppColors.lightGray,),

             suffixIcon:Image.asset(AssetsManager.iconUnShowPassword,color: isLight? AppColors.gray:AppColors.lightGray,),
                ),
            SizedBox(height:height*(16/841),),
        
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){
                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              },
                  child: Text(AppLocalizations.of(context)!.forget_password
                    ,style: AppStyles.boldItalic16primaryLight.copyWith(
                      decoration: TextDecoration.underline,
                       decorationColor: AppColors.primaryLight
                    ),)),
            ),
            SizedBox(height:height*(16/841),),
        
            CustomElevatedButton(buttonLabel: AppLocalizations.of(context)!.login,onClick: gotohome,)
            ,
            SizedBox(height:height*(16/841),),
        
            Text.rich(textAlign: TextAlign.center,
                TextSpan(
                children: [
                  TextSpan(text:AppLocalizations.of(context)!.do_not_have_account,
                      style:isLight? AppStyles.semi16Black :
                          AppStyles.semi16White
                  ),
        
        
                  TextSpan(recognizer: TapGestureRecognizer()..onTap=(  ){
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);},
                    text:AppLocalizations.of(context)!.create_account
                    ,
                      style: AppStyles.boldItalic16primaryLight.copyWith(decorationColor: AppColors.primaryLight
                          ,decoration: TextDecoration.underline) )]
                    )),
                    SizedBox(height:height*(16/841),),
                    Row(children: [
                    Expanded(child: Divider(color: AppColors.primaryLight,endIndent: width*(16/430),indent: width*(42/
                  430),))
              ,Text(AppLocalizations.of(context)!.or,style: AppStyles.semi16primaryLight,),
              Expanded(child: Divider(color: AppColors.primaryLight,indent: width*(16/430),endIndent: width*(42/430)))
            ],),
        
            SizedBox(height:height*(16/841),),
        
            CustomElevatedButton(buttonLabel: AppLocalizations.of(context)!.login_with_google,
              onClick: gotohome,
              backgroundColor: AppColors.white,icon:Image.asset(AssetsManager.iconGoogle),
            labelStyle: AppStyles.semi20primaryLight,),

            Container(width: width*(60/393),margin: EdgeInsets.symmetric(vertical: 20),
              decoration:
            BoxDecoration(border: Border.all(width: 2,color: AppColors.primaryLight),
                borderRadius:
                BorderRadius.circular(16),color: AppColors.transparent),

              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [InkWell(onTap: (){
                languageProvider.changeLanguage("en");

              },
                  child: Image.asset(AssetsManager.iconEnglishLanguage))
                ,InkWell(onTap: (){

                  languageProvider.changeLanguage("ar");

                },
                    child: Image.asset(AssetsManager.iconArabicLanguage))],),)






          ],),
        ),
      ),
    );
  }

  gotohome() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
