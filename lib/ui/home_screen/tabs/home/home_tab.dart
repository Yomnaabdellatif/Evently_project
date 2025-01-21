import 'package:evently_project/providers/event_list_provider.dart';
import 'package:evently_project/providers/user_provider.dart';
import 'package:evently_project/ui/home_screen/tabs/home/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../providers/app_language_provider.dart';
import '../../../../providers/app_theme_provider.dart';

import '../../event_details.dart';
import 'event_item_widget.dart';



class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {


  @override
  Widget build(BuildContext context) {

    var eventListProvider= Provider.of<EventListProvider>(context);
    var userProvider=Provider.of<UserProvider>(context);

    eventListProvider.getEventNameList(context);
    //todo uncomment when handle logic
    // if (eventListProvider.eventList.isEmpty){
    //   eventListProvider.getAllEvents(userProvider.currentUser!.id);}
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var languageProvider= Provider.of<AppLanguageProvider>(context);

    bool isLight= themeProvider.appTheme==ThemeMode.light;
    bool isEnglish= languageProvider.appLanguage=="en";

    return Scaffold(appBar: AppBar(
       automaticallyImplyLeading: false,
      title: Row(
      children:
      [Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:
            [Text(AppLocalizations.of(context)!.welcome_back,style: AppStyles.regular14White,),
        Text(userProvider.currentUser?.name??"",style: AppStyles.bold24White),
        
        
        
        
        
            ],),
      ),
        const Spacer(),
        InkWell(child: const Icon(Icons.sunny,color: AppColors.white,),onTap: (){
          if(isLight){
          themeProvider.changeTheme(ThemeMode.dark);
          }
          else{
            themeProvider.changeTheme(ThemeMode.light);
          }

        },),
        SizedBox(width: width*0.01,),
        InkWell(onTap: (){
          if(isEnglish){
            languageProvider.changeLanguage("ar");
          }
          else{
            languageProvider.changeLanguage("en");
          }


        },
          child: Container(child:
          Text(
            AppLocalizations.of(context)!.language_shortcut



          ,style: AppStyles.bold14primaryLight.copyWith(
            color: Theme.of(context).primaryColor),),
            padding: EdgeInsets.all(height*0.01),decoration: BoxDecoration(color: AppColors.white,
                borderRadius: BorderRadius.circular(8)),),
        )


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
                length: eventListProvider.eventNameList.length,
                child:
                TabBar(isScrollable: true,
                  indicatorColor: AppColors.transparent,
              labelPadding: EdgeInsets.symmetric(horizontal:width*0.01,vertical: height*0.02),
                  dividerColor: AppColors.transparent,
              tabAlignment: TabAlignment.start,
              onTap: (index){
                eventListProvider.changeSelectedIndex(index,userProvider.currentUser!.id);

              },

              tabs: eventListProvider.eventNameList.map((eventName){
              return TabEventWidget(backgroundColor: isLight? AppColors.white:AppColors.primaryLight,
                  textSelectedStyle: isLight? AppStyles.semi16primaryLight:AppStyles.semi16White
                  ,textUnSelectedStyle: AppStyles.semi16White,
                  eventName: eventName,
                  isSelected: eventListProvider.selectedIndex== eventListProvider.eventNameList.indexOf(eventName));
                  }).toList(),)),


          ],),),
        SizedBox(height: height*0.1,),
        Expanded(child:eventListProvider.filterList.isEmpty?
            Center(child: Text(AppLocalizations.of(context)!.no_events_found
              ,style: isLight? AppStyles.semi16Black: AppStyles.semi16LightGray,),):
        ListView.builder(itemBuilder: (context,index){
          return InkWell(onTap: (){
            final event = eventListProvider.filterList[index];
            eventListProvider.setSelectedEvent(event);
            Navigator.pushNamed(context, EventDetails.routeName);

          },
              child: EventItemWidget(event: eventListProvider.filterList[index],));},
          itemCount: eventListProvider.filterList.length,))],)
      ,) ;


  }
}
