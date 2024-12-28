import 'package:evently_project/home_screen/login_screen.dart';
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

import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName="register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    bool isLight= themeProvider.appTheme==ThemeMode.light;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register
        ,style: AppStyles.semi16Black,),centerTitle: true,
        backgroundColor: isLight ? AppColors.white:AppColors.primaryDark
        ,

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height*(16/841),),
          padding:  EdgeInsets.symmetric(horizontal: width*(16/393), ),
          child: Column(children: [
            Image.asset(AssetsManager.logo,height: height*(186/841),),
        
            SizedBox(height:height*(16/841) ,),
            CustomTextFormField(obscureText: true,
                hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
                hintText: AppLocalizations.of(context)!.name
              ,prefixIcon:
              Image.asset(AssetsManager.iconProfileLogin,color: isLight? AppColors.gray:AppColors.lightGray,)


              ,),
            SizedBox(height:height*(16/841),),

            CustomTextFormField(hintText: AppLocalizations.of(context)!.email,
              hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
              prefixIcon:
              Image.asset(AssetsManager.iconEmail,color: isLight? AppColors.gray:AppColors.lightGray,)
              ,),
            SizedBox(height:height*(16/841) ,),
            CustomTextFormField(obscureText: true,
              hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon:
              Image.asset(AssetsManager.iconPassword,color: isLight? AppColors.gray:AppColors.lightGray,)

              , suffixIcon:
              Image.asset(AssetsManager.iconUnShowPassword,color: isLight? AppColors.gray:AppColors.lightGray,)
              ,),
            SizedBox(height:height*(16/841),),
            CustomTextFormField(obscureText: true,
              hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
              hintText: AppLocalizations.of(context)!.re_password,
              prefixIcon:
              Image.asset(AssetsManager.iconPassword,color: isLight? AppColors.gray:AppColors.lightGray,)

              , suffixIcon:
              Image.asset(AssetsManager.iconUnShowPassword,color: isLight? AppColors.gray:AppColors.lightGray,)
              ,),
            SizedBox(height:height*(16/841),),
        
            CustomElevatedButton(buttonLabel:
            AppLocalizations.of(context)!.create_account,
            onClick: gotohome,)
            ,
            SizedBox(height:height*(16/841),),
        
            Text.rich(textAlign: TextAlign.center,
                TextSpan(
                    children: [
                      TextSpan(text:
                      AppLocalizations.of(context)!.already_have_account,
                          style:isLight? AppStyles.semi16Black :
                          AppStyles.semi16White ),
        
        
            TextSpan(recognizer: TapGestureRecognizer()..onTap=(  ){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);},
                text:AppLocalizations.of(context)!.login,style:AppStyles.boldItalic16primaryLight.copyWith(decorationColor: AppColors.primaryLight
                    ,decoration: TextDecoration.underline)
        
            )])),
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
                      child: Image.asset(AssetsManager.iconArabicLanguage))],),),

            SizedBox(height:height*(16/841),),
        
        
        
        
        
        
        
          ],),
        ),
      ),
    );
  }

  gotohome() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
