import 'package:evently_project/home_screen/edit_event.dart';
import 'package:evently_project/home_screen/home_screen.dart';
import 'package:evently_project/model/event.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_styles.dart';
import '../../../providers/app_theme_provider.dart';
import '../providers/event_list_provider.dart';
import '../providers/user_provider.dart';
import '../utilities/dialog_utils.dart';


class EventDetails extends StatelessWidget {
  static String routeName="eventDetails";
  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var eventListProvider= Provider.of<EventListProvider>(context);
    var userProvider= Provider.of<UserProvider>(context);


    bool isLight= themeProvider.appTheme==ThemeMode.light;

    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var event = eventListProvider.selectedEvent;

    return Scaffold(appBar:
    AppBar(title: Text(AppLocalizations.of(context)!.event_details
      ,style: AppStyles.semi16primaryLight,),centerTitle: true,

     actions: [
       IconButton(onPressed: (){
         eventListProvider.setSelectedEvent(eventListProvider.selectedEvent!);
         print(eventListProvider.selectedEvent!.eventName);
         Navigator.pushNamed(context, EditEvent.routeName);

     },padding: EdgeInsets.only(left: width*(70/393)),
         icon: Image.asset(AssetsManager.iconEdit,color: AppColors.primaryLight,)),

       IconButton(onPressed: (){
         DialogUtils.showMessage(context: context,
             message: "do you want to delete event?",
             title: "delete",
             posActionName: "cancel"
             ,negActionName:"delete" ,
             negAction:(){
               eventListProvider.deleteEvent(event!.id, context, userProvider.currentUser!.id);
               if(eventListProvider.selectedIndex==0){
                 eventListProvider.getAllEvents(userProvider.currentUser!.id);
               }else {eventListProvider.getFilterEvents(userProvider.currentUser!.id);}
               Navigator.pushReplacementNamed(context, HomeScreen.routeName);


             } ,
             posAction: () {
               Navigator.pop(context);

             }
             );


       },
           icon: Image.asset(AssetsManager.iconDelete)),
     ],
      iconTheme: IconThemeData(color: AppColors.primaryLight),
      forceMaterialTransparency: true,),
      body: Container(margin: EdgeInsets.symmetric(horizontal: width*(16/393),),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(16),
                child: Image.asset(eventListProvider.selectedEvent!.image,
                  width: width*(361/393),height: height*(203/840),
                  fit: BoxFit.fill,
                ),),
              SizedBox(height:height*(16/841) ,),
              Text(eventListProvider.selectedEvent!.title,style: AppStyles.semi24primaryLight,),
              SizedBox(height:height*(16/841) ,),
              Container(decoration:
              BoxDecoration(border: Border.all(color: AppColors.primaryLight),borderRadius: BorderRadius.circular(16)), height:height*(69/841) ,
                  child: Row(children:
                  [
                    Container(
                        width: width*(46/393)
                        ,height: height*(46/840),
                        padding: EdgeInsets.symmetric(horizontal:  width*0.02,vertical: height*0.01),margin: EdgeInsets.all(width*0.02),
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:
                        Icon(Icons.calendar_month,color: AppColors.white,)),
                    Column(children: [
                      Text(DateFormat("dd MMM yyyy").format(eventListProvider.selectedEvent!.dateTime),style: AppStyles.semi16primaryLight,),
                      Text(eventListProvider.selectedEvent!.time,style: isLight?
                      AppStyles.semi16Black: AppStyles.semi16White,),


                    ],),
                  ],)),
              SizedBox(height:height*(16/841) ,),
              Container(decoration:
              BoxDecoration(border: Border.all(color: AppColors.primaryLight),borderRadius: BorderRadius.circular(16)), height:height*(69/841) ,
                  child: Row(children:
                  [
                    Container(
                        width: width*(46/393)
                        ,height: height*(46/840),
                        padding: EdgeInsets.symmetric(horizontal:  width*0.02,vertical: height*0.01),margin: EdgeInsets.all(width*0.02),
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.my_location_rounded,color: AppColors.white,)),
                    Text(AppLocalizations.of(context)!.choose_event_location,style: AppStyles.semi16primaryLight,),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,color: AppColors.primaryLight,)

                  ],)),
              SizedBox(height:height*(16/841) ,),
              Container(decoration:
              BoxDecoration(border: Border.all(color: AppColors.primaryLight),borderRadius: BorderRadius.circular(16)), height:height*(69/841) ,
                  ),
              Text(AppLocalizations.of(context)!.description,style:  isLight?
              AppStyles.semi16Black: AppStyles.semi16White
                ,),
              Text(eventListProvider.selectedEvent!.description,style:  isLight?
              AppStyles.semi16Black: AppStyles.semi16White
                ,)


            ],
          ),
        ),),




    );
  }
  }

