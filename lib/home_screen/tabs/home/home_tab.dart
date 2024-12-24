import 'package:evently_project/home_screen/tabs/home/event_item_widget.dart';
import 'package:evently_project/home_screen/tabs/home/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:evently_project/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';


class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    List<String> eventNameList=[
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.work_shop,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.gaming,

    ];
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    var themeProvider= Provider.of<AppThemeProvider>(context);
    return Scaffold(appBar: AppBar(
      title: Row(
      children:
      [Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:
    [Text(AppLocalizations.of(context)!.welcome_back,style: AppStyles.regular14White,),
      Text("YOMNA",style: AppStyles.bold24White,),





    ],),
        const Spacer(),
        const Icon(Icons.sunny,color: AppColors.white,),
        SizedBox(width: width*0.01,),
        Container(child:  Text("EN",style: AppStyles.bold14primaryLight.copyWith(
          color: Theme.of(context).primaryColor),),
          padding: EdgeInsets.all(height*0.01),decoration: BoxDecoration(color: AppColors.white,
              borderRadius: BorderRadius.circular(8)),)


      ],),
      backgroundColor:Theme.of(context).primaryColor,),
      body: Column(children: [
        Container(height: height*0.16,
          padding: EdgeInsets.symmetric(horizontal: height*0.02,vertical: width*0.02),
          decoration:
        BoxDecoration(color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)))
          ,child: Column(
            children: [
            Row(
              children: [
                Image.asset(AssetsManager.iconMap),
                Text("cairo,Egypt",style: AppStyles.semi14White,),
              ],
            ),
              DefaultTabController(
                length: eventNameList.length,
                child:
                TabBar(isScrollable: true,
                  indicatorColor: AppColors.transparent,
              labelPadding: EdgeInsets.symmetric(horizontal:width*0.01,vertical: height*0.02),
                  dividerColor: AppColors.transparent,
              tabAlignment: TabAlignment.start,
              onTap: (index){
                  selectedIndex=index;
                  setState(() {

                  });
              },

              tabs: eventNameList.map((eventName){
              return TabEventWidget(eventName: eventName, isSelected: selectedIndex==eventNameList.indexOf(eventName));

              }).toList(),)),


          ],),),
        SizedBox(height: height*0.1,),
        Expanded(child:
        ListView.builder(itemBuilder: (context,index){
          return EventItemWidget();},
          itemCount: 15,))],)
      ,) ;


  }
}
