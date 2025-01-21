import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:evently_project/providers/app_language_provider.dart';
import 'package:evently_project/providers/app_theme_provider.dart';
import 'package:evently_project/providers/event_list_provider.dart';
import 'package:evently_project/providers/user_provider.dart';
import 'package:evently_project/ui/auth/login/login_screen.dart';
import 'package:evently_project/ui/auth/register/register_screen.dart';
import 'package:evently_project/ui/home_screen/create_event_screen.dart';
import 'package:evently_project/ui/home_screen/edit_event.dart';
import 'package:evently_project/ui/home_screen/event_details.dart';
import 'package:evently_project/ui/home_screen/home_screen.dart';
import 'package:evently_project/ui/home_screen/onbording/splash_screen.dart';
import 'package:evently_project/ui/home_screen/onbording/start_screen.dart';
import 'package:evently_project/ui/home_screen/reset_password_screen.dart';
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
final languageProvider = AppLanguageProvider();
final themeProvider = AppThemeProvider();
await languageProvider.loadLanguage();
await themeProvider.loadTheme();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>languageProvider),
        ChangeNotifierProvider(create: (context)=>themeProvider),
        ChangeNotifierProvider(create: (context)=> EventListProvider()),
        ChangeNotifierProvider(create: (context)=> UserProvider())


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
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),

        StartScreen.routeName: (context) => StartScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        CreateEventScreen.routeName: (context) => CreateEventScreen(),
        EventDetails.routeName:(context)=> EventDetails(),
        EditEvent.routeName:(context)=> EditEvent(),




      },
    );
  }




}
