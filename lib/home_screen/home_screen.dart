import 'package:evently_project/home_screen/create_event_screen.dart';
import 'package:evently_project/home_screen/language_bottom_sheet.dart';
import 'package:evently_project/home_screen/tabs/favorite/favorite_tab.dart';
import 'package:evently_project/home_screen/tabs/home/home_tab.dart';
import 'package:evently_project/home_screen/tabs/map/map_tab.dart';
import 'package:evently_project/home_screen/tabs/profile/profile_tab.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/app_language_provider.dart';
import '../providers/app_theme_provider.dart';


class HomeScreen extends StatefulWidget {
  static String routeName="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex=0;
List<Widget>tabs=[HomeTab(),MapTab(),FavoriteTab(),ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;



    return Scaffold(

      bottomNavigationBar:
      Theme(data: Theme.of(context).copyWith(
        canvasColor:
          Colors.transparent
        // Theme.of(context).primaryColor,
      ),
        child: BottomAppBar(
          color:Theme.of(context).primaryColor ,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
           selectedIndex=index;
           setState(() {
           });
          
            },
            items:
          [
            buildBottomNavigationBarItem(iconName: AssetsManager.iconHome,
                index: 0,
                iconSelectedName:AssetsManager.iconHomeSelected ,
                label: AppLocalizations.of(context)!.home),
            buildBottomNavigationBarItem(
                index: 1,
                iconSelectedName:AssetsManager.iconMapSelected ,
                iconName: AssetsManager.iconMap, label: AppLocalizations.of(context)!.map),
          
            buildBottomNavigationBarItem(index: 2,
                iconSelectedName:AssetsManager.iconLoveSelected ,
                iconName: AssetsManager.iconLove, label:AppLocalizations.of(context)!.love),
            buildBottomNavigationBarItem(index: 3,
                iconSelectedName:AssetsManager.iconProfileSelected ,
                iconName: AssetsManager.iconProfile, label:AppLocalizations.of(context)!.profile),
          ],
          
               ),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, CreateEventScreen.routeName);
      },child: Icon(Icons.add,color: AppColors.white,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex]




    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String iconName,required String label,required int index,required  String iconSelectedName }){
    return BottomNavigationBarItem(icon:ImageIcon(selectedIndex==index?
    AssetImage(iconSelectedName)
    :
    AssetImage(iconName)

    )
        ,label:label );
  }


}
