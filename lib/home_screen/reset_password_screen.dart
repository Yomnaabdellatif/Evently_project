import 'package:evently_project/home_screen/login_screen.dart';
import 'package:evently_project/home_screen/tabs/custom_elevated_button.dart';
import 'package:evently_project/home_screen/tabs/custom_text_form_field.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static String routeName="rePassword";

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.forget_password
        ,style: AppStyles.semi16Black,),centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: height*(16/841),),
        padding:  EdgeInsets.symmetric(horizontal: width*(16/393), ),
        child: Column(children: [
          Image.asset(AssetsManager.changeSetting),

          SizedBox(height:height*(16/841) ,),
          CustomTextFormField(obscureText: true,
            hintText: AppLocalizations.of(context)!.email
            ,prefixIcon: Image.asset(AssetsManager.iconName,color: AppColors.gray,)

            ,),

          SizedBox(height:height*(16/841),),

          CustomElevatedButton(buttonLabel:
          AppLocalizations.of(context)!.reset_password,
            onClick: gotohome,)


        ],),
      ),
    );
  }

  void gotohome() {
    // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
