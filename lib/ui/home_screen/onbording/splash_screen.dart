import 'package:evently_project/ui/home_screen/onbording/start_screen.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, StartScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    bool isLight= themeProvider.appTheme==ThemeMode.light;
    return Scaffold(

      body: Image.asset(isLight?AssetsManager.splashLight:AssetsManager.splashDark,
        fit: BoxFit.fill,
        width: double.infinity,height: double.infinity,),
    );
  }
}
