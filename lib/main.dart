import 'package:evently_project/home_screen/create_event_screen.dart';
import 'package:evently_project/home_screen/home_screen.dart';
import 'package:evently_project/home_screen/login_screen.dart';
import 'package:evently_project/home_screen/onbording/start_screen.dart';
import 'package:evently_project/home_screen/register_screen.dart';
import 'package:evently_project/home_screen/reset_password_screen.dart';
import 'package:evently_project/providers/app_language_provider.dart';
import 'package:evently_project/providers/app_theme_provider.dart';
import 'package:evently_project/utilities/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>AppLanguageProvider()),
        ChangeNotifierProvider(create: (context)=>AppThemeProvider())
      ],

          child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    var themeProvider= Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      locale:Locale(languageProvider.appLanguage) ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        CreateEventScreen.routeName: (context) => CreateEventScreen(),


      },
    );
  }




}
