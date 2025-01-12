import 'package:evently_project/home_screen/login_screen.dart';
import 'package:evently_project/home_screen/tabs/custom_elevated_button.dart';
import 'package:evently_project/home_screen/tabs/custom_text_form_field.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../firebase_utils.dart';
import '../providers/app_language_provider.dart';
import '../providers/app_theme_provider.dart';
import '../providers/user_provider.dart';
import '../utilities/dialog_utils.dart';
import 'home_screen.dart';
import 'package:evently_project/model/user.dart';



class RegisterScreen extends StatefulWidget {
  static String routeName="register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var emailController=TextEditingController();
  var nameController=TextEditingController();
  var passwordController=TextEditingController();
  var rePasswordController=TextEditingController();
  bool unShowPass=true;
  bool unShowRePass=true;

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    bool isLight= themeProvider.appTheme==ThemeMode.light;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register
        ,style: isLight? AppStyles.semi16Black:AppStyles.semi16primaryLight
      ),centerTitle: true,
        backgroundColor: isLight ? AppColors.white:AppColors.primaryDark
        ,iconTheme: IconThemeData(color:isLight ? AppColors.black:AppColors.primaryLight
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height*(16/841),),
          padding:  EdgeInsets.symmetric(horizontal: width*(16/393), ),
          child: Form(
            key: formKey,
            child: Column(children: [
              Image.asset(AssetsManager.logo,height: height*(186/841),),

              SizedBox(height:height*(16/841) ,),
              CustomTextFormField(
                textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,

                hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
                borderColor:
                isLight?
                AppColors.gray:AppColors.primaryLight ,
                  hintText: AppLocalizations.of(context)!.name,
                controller: nameController,

                validator: (text){
                if(text==null || text.trim().isEmpty){
                  return "enter name";
                }
                return null;
                },
                prefixIcon:
                Image.asset(AssetsManager.iconProfileLogin,color: isLight? AppColors.gray:AppColors.lightGray,),

              ),
              SizedBox(height:height*(16/841),),

              CustomTextFormField(hintText: AppLocalizations.of(context)!.email,
                validator: (text){
                  if(text==null || text.trim().isEmpty){
                    return "enter email";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                  if(!emailValid){
                    return "enter valid email";
                  }
                  return null;
                },
                controller: emailController,
                keyBoardType: TextInputType.emailAddress,
                borderColor:
                isLight?
                AppColors.gray:AppColors.primaryLight ,
                hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
                textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,

                prefixIcon:
                Image.asset(AssetsManager.iconEmail,color: isLight? AppColors.gray:AppColors.lightGray,)
                ,),
              SizedBox(height:height*(16/841) ,),
              CustomTextFormField(obscureText: unShowPass,
                textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,

                borderColor:
                isLight?
                AppColors.gray:AppColors.primaryLight ,
                hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
                hintText: AppLocalizations.of(context)!.password,
                controller: passwordController,
                validator: (text){
                  if(text==null || text.trim().isEmpty){
                    return "enter password";
                  }

                  if(text.length<6){
                    return "password at least 6 chars";
                  }
                  return null;
                },
                prefixIcon:
                Image.asset(AssetsManager.iconPassword,color: isLight? AppColors.gray:AppColors.lightGray,)

                , suffixIcon:
                InkWell(onTap: (){
                  unShowPass=!unShowPass;
                  setState(() {

                  });
                },
                  child: unShowPass? Image.asset(AssetsManager.iconUnShowPassword,
                    color: isLight ? AppColors.gray : AppColors.lightGray,):
                  Icon(CupertinoIcons.eye,color:  isLight ? AppColors.gray : AppColors.lightGray,)
                  ,
                )                ,),
              SizedBox(height:height*(16/841),),
              CustomTextFormField(obscureText: unShowRePass,
                textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,
                hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
                hintText: AppLocalizations.of(context)!.re_password,
                controller: rePasswordController,
                validator: (text){
                  if(text==null || text.trim().isEmpty){
                    return "enter re password";
                  }

                  if(text.length<6){
                    return "password at least 6 chars";
                  }
                  if(text!=passwordController.text){
                    return "re password should be match with password";
                  }

                  return null;
                },
                prefixIcon:
                Image.asset(AssetsManager.iconPassword,color: isLight? AppColors.gray:AppColors.lightGray,),
                borderColor:
                isLight?
                AppColors.gray:AppColors.primaryLight

                , suffixIcon:
                InkWell(onTap: (){
                  unShowRePass=!unShowRePass;
                  setState(() {

                  });
                },
                  child: unShowRePass? Image.asset(AssetsManager.iconUnShowPassword,
                    color: isLight ? AppColors.gray : AppColors.lightGray,):
                  Icon(CupertinoIcons.eye,color:  isLight ? AppColors.gray : AppColors.lightGray,)
                  ,
                )                ,),
              SizedBox(height:height*(16/841),),

              CustomElevatedButton(buttonLabel:
              AppLocalizations.of(context)!.create_account,
              onClick: register,)
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
                  text:AppLocalizations.of(context)!.login,style:AppStyles.boldItalic16primaryLight.
                  copyWith(decorationColor: AppColors.primaryLight
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
      ),
    );
  }

  register() async{


    if(formKey.currentState?.validate()==true){
      DialogUtils.showLoading(context: context, message: "LOADING...");
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        MyUser user= MyUser(id: credential.user?.uid??"", name: nameController.text, email: emailController.text);
        var userProvider=Provider.of<UserProvider>(context,listen: false);
        userProvider.updateUser(user);
        await FirebaseUtils.addUserToFireStore(user);
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context: context, message: "register successfully",
            title: "success",posActionName: "ok"
            ,posAction: (){
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        });



      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: "The password provided is too weak.",
              title: "Error",posActionName: "ok");
        } else if (e.code == 'email-already-in-use') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: "The account already exists for that email.",
              title: "Error",posActionName: "ok"
          );
        }
      }



      catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context: context, message: e.toString());
      }




    }
  }




}
