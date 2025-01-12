import 'package:evently_project/firebase_utils.dart';
import 'package:evently_project/home_screen/home_screen.dart';
import 'package:evently_project/home_screen/register_screen.dart';
import 'package:evently_project/home_screen/reset_password_screen.dart';
import 'package:evently_project/home_screen/tabs/custom_elevated_button.dart';
import 'package:evently_project/home_screen/tabs/custom_text_form_field.dart';
import 'package:evently_project/providers/event_list_provider.dart';
import 'package:evently_project/providers/user_provider.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:evently_project/utilities/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../providers/app_language_provider.dart';
import '../providers/app_theme_provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool unShowPass=true;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    var themeProvider = Provider.of<AppThemeProvider>(context);

    bool isLight = themeProvider.appTheme == ThemeMode.light;
    bool isEnglish= languageProvider.appLanguage=="en";

    return Scaffold(
      backgroundColor: isLight
          ? AppColors.white :
      AppColors.primaryDark,

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height * (64 / 841),),
          padding: EdgeInsets.symmetric(horizontal: width * (16 / 393),),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(AssetsManager.logo, height: height * (186 / 841),),
                SizedBox(height: height * (16 / 841),),

                CustomTextFormField(
                  hintText: AppLocalizations.of(context)!.email,
                  validator: (text) {
                    if (text == null || text
                        .trim()
                        .isEmpty) {
                      return "enter email";
                    }
                    final bool emailValid =
                    RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return "enter valid email";
                    }
                    return null;
                  },
                  controller: emailController,
                  keyBoardType: TextInputType.emailAddress,
                  borderColor:
                  isLight ?
                  AppColors.gray : AppColors.primaryLight,
                  hintStyle: isLight ? AppStyles.semi16Gray : AppStyles.semi16LightGray,
                  textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,
                  prefixIcon:
                  Image.asset(AssetsManager.iconEmail,
                    color: isLight ? AppColors.gray : AppColors.lightGray,)
                  ,),
                SizedBox(height: height * (16 / 841),),
                CustomTextFormField(
                  obscureText: unShowPass,
                  borderColor:
                  isLight ?
                  AppColors.gray : AppColors.primaryLight,
                  textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,

                  hintStyle: isLight ? AppStyles.semi16Gray : AppStyles
                      .semi16LightGray,
                  hintText: AppLocalizations.of(context)!.password,
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text
                        .trim()
                        .isEmpty) {
                      return "enter password";
                    }

                    if (text.length < 6) {
                      return "password at least 6 chars";
                    }
                    return null;
                  },
                  prefixIcon:
                  Image.asset(AssetsManager.iconPassword,
                    color: isLight ? AppColors.gray : AppColors.lightGray,)

                  ,
                  suffixIcon:
                  InkWell(onTap: (){
                    unShowPass=!unShowPass;
                    setState(() {

                    });
                  },
                    child: unShowPass? Image.asset(AssetsManager.iconUnShowPassword,
                      color: isLight ? AppColors.gray : AppColors.lightGray,):
                      Icon(CupertinoIcons.eye,color:  isLight ? AppColors.gray : AppColors.lightGray,)
                    ,
                  )
                  ,),
                SizedBox(height: height * (16 / 841),),

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pushNamed(
                        ResetPasswordScreen.routeName);
                  },
                      child: Text(AppLocalizations.of(context)!.forget_password
                        , style: AppStyles.boldItalic16primaryLight.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLight
                        ),)),
                ),
                SizedBox(height: height * (16 / 841),),

                CustomElevatedButton(
                  buttonLabel: AppLocalizations.of(context)!.login,
                  onClick: login,)
                ,
                SizedBox(height: height * (16 / 841),),

                Text.rich(textAlign: TextAlign.center,
                    TextSpan(
                        children: [
                          TextSpan(text: AppLocalizations.of(context)!
                              .do_not_have_account,
                              style: isLight ? AppStyles.semi16Black :
                              AppStyles.semi16White
                          ),


                          TextSpan(recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(
                                  RegisterScreen.routeName);
                            },
                              text: AppLocalizations.of(context)!.create_account
                              ,
                              style: AppStyles.boldItalic16primaryLight
                                  .copyWith(
                                  decorationColor: AppColors.primaryLight
                                  , decoration: TextDecoration.underline))
                        ]
                    )),
                SizedBox(height: height * (16 / 841),),
                Row(children: [
                  Expanded(child: Divider(color: AppColors.primaryLight,
                    endIndent: width * (16 / 430),
                    indent: width * (42 /
                        430),))
                  ,
                  Text(AppLocalizations.of(context)!.or,
                    style: AppStyles.semi16primaryLight,),
                  Expanded(child: Divider(color: AppColors.primaryLight,
                      indent: width * (16 / 430),
                      endIndent: width * (42 / 430)))
                ],),

                SizedBox(height: height * (16 / 841),),

                CustomElevatedButton(
                  buttonLabel: AppLocalizations.of(context)!.login_with_google,
                  onClick: signInWithGoogle,

                  backgroundColor: isLight ?
                  AppColors.white : AppColors.transparent,
                  icon: Image.asset(AssetsManager.iconGoogle),
                  labelStyle: AppStyles.semi20primaryLight,),

                Container(width: width * (60 / 393),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration:
                  BoxDecoration(border: Border.all(
                      width: 2, color: AppColors.primaryLight),
                      borderRadius:
                      BorderRadius.circular(16), color: AppColors.transparent),

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
          ),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context, message: "LOADING.....");

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        var user = await FirebaseUtils.readUserFromFireStore(
            credential.user?.uid ?? "");
        if (user == null) {
          return;
        }
        var eventListProvider = Provider.of<EventListProvider>(
            context, listen: false);

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user);
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context: context,
            message: "login successfully",
            title: "success",
            posActionName: "ok"
            ,
            posAction: () {
              eventListProvider.getAllEvents(userProvider.currentUser!.id);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            });
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: "No user found for that email"
              , title: "Error", posActionName: "ok");
        } else if (e.code == 'wrong-password') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context,
              message: "Wrong password provided for that user."
              ,
              title: "Error",
              posActionName: "ok");
        } else if (e.code == 'invalid-credential') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: "not found this email",
              title: "Error", posActionName: "ok");
        }
        else if (e.code == 'network-request-failed') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: "network error",
            title: "Error", posActionName: "ok",);
        }
      }
      catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context, message: e.toString(), title: "Error");
      }

    }
  }

  Future<void> signInWithGoogle() async {
    DialogUtils.showLoading(context: context, message: "LOADING.....");

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        DialogUtils.hideLoading(context);
        return;
      }
      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      final User? firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: "Failed to retrieve user details.",
          title: "Error",
          posActionName: "OK",
        );
        return;
      }

      var user = await FirebaseUtils.readUserFromFireStore(firebaseUser.uid);

      if (user == null) {
        user = MyUser(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? "No Name",
          email: firebaseUser.email ?? "No Email",
        );

        await FirebaseUtils.addUserToFireStore(user);
      }

      var eventListProvider = Provider.of<EventListProvider>(context, listen: false);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.updateUser(user);

      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: "Login successfully",
        title: "login with google",
        posActionName: "OK",
        posAction: () {
          eventListProvider.getAllEvents(userProvider.currentUser!.id);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        },
      );
    }  catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: e.toString(),
        title: "Error",
        posActionName: "OK",
      );
    }
  }
}
