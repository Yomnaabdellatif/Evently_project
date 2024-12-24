import 'package:evently_project/home_screen/login_screen.dart';
import 'package:evently_project/home_screen/tabs/custom_elevated_button.dart';
import 'package:evently_project/home_screen/tabs/custom_text_form_field.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register
        ,style: AppStyles.semi16Black,),centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: height*(16/841),),
        padding:  EdgeInsets.symmetric(horizontal: width*(16/393), ),
        child: Column(children: [
          Image.asset(AssetsManager.logo),

          SizedBox(height:height*(16/841) ,),
          CustomTextFormField(obscureText: true,
      hintText: AppLocalizations.of(context)!.name
            ,prefixIcon: Image.asset(AssetsManager.iconName,color: AppColors.gray,)

       ,),
    SizedBox(height:height*(16/841),),

          CustomTextFormField(hintText: AppLocalizations.of(context)!.email
            ,prefixIcon: Image.asset(AssetsManager.iconEmail),),
          SizedBox(height:height*(16/841) ,),
          CustomTextFormField(obscureText: true,
            hintText: AppLocalizations.of(context)!.password,prefixIcon: Image.asset(AssetsManager.iconPassword)
            ,suffixIcon:Image.asset(AssetsManager.iconUnShowPassword) ,),
          SizedBox(height:height*(16/841),),
          CustomTextFormField(obscureText: true,
            hintText: AppLocalizations.of(context)!.password,prefixIcon: Image.asset(AssetsManager.iconPassword)
            ,suffixIcon:Image.asset(AssetsManager.iconUnShowPassword) ,),
          SizedBox(height:height*(16/841),),


          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(onPressed: (){},
                child: Text(AppLocalizations.of(context)!.forget_password
                  ,style: AppStyles.boldItalic16primaryLight.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryLight
                  ),)),
          ),
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
                        style: AppStyles.semi16Black ),


          TextSpan(recognizer: TapGestureRecognizer()..onTap=(  ){
            Navigator.of(context).pushNamed(LoginScreen.routeName);},
              text:AppLocalizations.of(context)!.login,style:AppStyles.boldItalic16primaryLight.copyWith(decorationColor: AppColors.primaryLight
                  ,decoration: TextDecoration.underline)

          )])),
          SizedBox(height:height*(16/841),),







        ],),
      ),
    );
  }

  gotohome() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
