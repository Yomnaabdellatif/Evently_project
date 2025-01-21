import 'package:evently_project/firebase_utils.dart';
import '../../providers/app_theme_provider.dart';
import '../../providers/user_provider.dart';
import '../../utilities/app_styles.dart';
import '../home_screen/tabs/choose_date_or_time.dart';
import '../home_screen/tabs/custom_elevated_button.dart';
import '..//home_screen/tabs/custom_text_form_field.dart';
import '../home_screen/tabs/home/tab_event_widget.dart';
import 'package:evently_project/model/event.dart';
import 'package:evently_project/providers/event_list_provider.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/assets_manager.dart';
import 'package:evently_project/utilities/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class CreateEventScreen extends StatefulWidget {
static const String routeName="createEvent";

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
int selected=0;
var formKey=GlobalKey<FormState>();
var titleController=TextEditingController();
var descriptionController=TextEditingController();
DateTime?selectedDate;
TimeOfDay?selectedTime;
String formatedDate="";
String formatedTime="";

String selectedImage="";
String selectedEvent="";
 late EventListProvider eventListProvider;
late UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
     userProvider=Provider.of<UserProvider>(context);

    List<String> eventNameList=[
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
    List<String> eventImageList=[
      AssetsManager.sports,
      AssetsManager.meeting,
      AssetsManager.eating,
      AssetsManager.bookClub,
      AssetsManager.birthday,
      AssetsManager.exhibition,
      AssetsManager.workShop,
      AssetsManager.holiday,
      AssetsManager.gaming,


    ];
    selectedImage=eventImageList[selected];
    selectedEvent=eventNameList[selected];
    var themeProvider= Provider.of<AppThemeProvider>(context);
     eventListProvider= Provider.of<EventListProvider>(context);
    bool isLight= themeProvider.appTheme==ThemeMode.light;


    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(appBar:
    AppBar(title: Text(AppLocalizations.of(context)!.create_event
      ,style: AppStyles.semi16primaryLight,),centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryLight),
      forceMaterialTransparency: true,

    ),
      body: Container(margin: EdgeInsets.symmetric(horizontal: width*(16/393),),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(16),
              child: Image.asset(eventImageList[selected],
                width: width*(361/393),height: height*(203/840),
                fit: BoxFit.fill,
             ),),
          SizedBox(height:height*(16/841) ,),
            SizedBox(
              height: height*(40/840),
              child: ListView.separated(itemBuilder: (context, index){
                return InkWell(onTap: (){
                  selected=index;
                  setState(() {

                  });
                },
                    child: TabEventWidget(backgroundColor: AppColors.primaryLight,
                    textUnSelectedStyle: AppStyles.semi16primaryLight,
                        textSelectedStyle:isLight?
                        AppStyles.semi16White:
                        AppStyles.semi16primaryLight.copyWith(color: AppColors.primaryDark)


                        ,

                    eventName: eventNameList[index], isSelected: selected==index));
                },
                itemCount: eventNameList.length,scrollDirection: Axis.horizontal,
                separatorBuilder: (context,index){
                return SizedBox(width: width*(10/393),);
                },

              ),

            ),
            SizedBox(height:height*(16/841) ,),
          Form(key: formKey,
          child:
          Column(

            crossAxisAlignment: CrossAxisAlignment.stretch
            ,
            children: [
            Text(AppLocalizations.of(context)!.title,
              style:isLight? AppStyles.semi16Black:AppStyles.semi16LightGray

              ,),
            SizedBox(height:height*(8/841) ,),
            CustomTextFormField(validator: (text){

              if(text==null||text.isEmpty){
                return AppLocalizations.of(context)!.please_enter_event_title;
              }

              return null;

            },
              controller: titleController,
              textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,
              hintText: AppLocalizations.of(context)!.event_title,
              hintStyle:isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray
              ,
              prefixIcon:
              Image.asset(AssetsManager.iconEdit,color: isLight? AppColors.gray:AppColors.lightGray,),),

            SizedBox(height:height*(16/841) ,),
            Text(AppLocalizations.of(context)!.description,
                style:isLight? AppStyles.semi16Black:AppStyles.semi16LightGray
            ),
            SizedBox(height:height*(8/841) ,),
            CustomTextFormField(controller: descriptionController,
              textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,
              validator: (text){
                if(text==null||text.isEmpty){
                  return AppLocalizations.of(context)!.please_enter_event_description;
                }
                return null;
              },

              hintStyle: isLight? AppStyles.semi16Gray:AppStyles.semi16LightGray,
              hintText: AppLocalizations.of(context)!.event_description,maxLines: 4,),
            SizedBox(height:height*(16/841) ,),
            ChooseDateOrTime(icon: Icons.calendar_month,
                iconColor: isLight?AppColors.black:AppColors.lightGray,

                textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray,

                eventDateOrTime: AppLocalizations.of(context)!.event_date,
              chooseEventDateOrTime: selectedDate==null?
              AppLocalizations.of(context)!.choose_date
              : DateFormat("dd/MM/yyyy").format(selectedDate!)
              ,
              // " ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              onChooseDateOrTime: chooseDate,),
            ChooseDateOrTime(icon: Icons.access_time_rounded
              ,iconColor: isLight?AppColors.black:AppColors.lightGray,

              textStyle: isLight? AppStyles.semi16Black:AppStyles.semi16LightGray
              ,
              eventDateOrTime: AppLocalizations.of(context)!.event_time,

              chooseEventDateOrTime: selectedTime==null ?
              AppLocalizations.of(context)!.choose_time:
                  formatedTime,

              onChooseDateOrTime: chooseTime,),
            Text(AppLocalizations.of(context)!.location,
              style:isLight? AppStyles.semi16Black:AppStyles.semi16LightGray
              ,),
            SizedBox(height:height*(8/841) ,),
            Container(decoration: BoxDecoration(border: Border.all(color: AppColors.primaryLight)
                ,borderRadius: BorderRadius.circular(16)),
                height:height*(69/841) ,
                child:
                Row(children:
                [
                  Container(
                      width: width*(46/393)
                      ,height: height*(46/840),
                      padding: EdgeInsets.symmetric(horizontal:  width*0.02,vertical: height*0.01),margin: EdgeInsets.all(width*0.02),
                      decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.my_location_rounded,color: AppColors.white,)),
                  Text(AppLocalizations.of(context)!.choose_event_location,style: AppStyles.semi16primaryLight,),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,color: AppColors.primaryLight,)

                ],)
            ),
            SizedBox(height:height*(16/841) ,),
            CustomElevatedButton(buttonLabel: AppLocalizations.of(context)!.add_event, onClick: onClick),],)),
            SizedBox(height:height*(16/841) ,),

          ],
        ),
      ),),




      );
  }
  onClick() {
    if(formKey.currentState!.validate()==true){
      Event event=Event(title: titleController.text,
          description: descriptionController.text,
          eventName: selectedEvent,
          image: selectedImage,
          time:formatedTime,
          dateTime:selectedDate!
      );

      FirebaseUtils.addEventToFireStore(event,userProvider.currentUser!.id).then((value){

        if(eventListProvider.selectedIndex==0){
          eventListProvider.getAllEvents(userProvider.currentUser!.id);

        }else {eventListProvider.getFilterEvents(userProvider.currentUser!.id);}
        ToastMassage.toastMsg(msg: AppLocalizations.of(context)!.added_event);
        Navigator.pop(context);

      }
      );
      // timeout( Duration(milliseconds: 600),onTimeout: (){
      //   eventListProvider.getAllEvents(userProvider.currentUser!.id);
      //   ToastMassage.toastMsg(msg: AppLocalizations.of(context)!.added_event);
      //   Navigator.pop(context);
      //   selected=0;
      // });


    }
  }

  void chooseTime()async {
    var chooseTime=await showTimePicker(context: context, initialTime: TimeOfDay.now(),errorInvalidText: "choose date");
    selectedTime=chooseTime;
    formatedTime=selectedTime!.format(context);
    
    setState(() {
    });
  }
  void chooseDate() async{
   var chooseDate=await showDatePicker(context: context,
        firstDate: DateTime.now(),
        lastDate:  DateTime.now().add(const Duration(days: 365)),
        initialDate: DateTime.now());
   selectedDate=chooseDate;
   // formatedDate=DateFormat("dd/MM/yyyy").format(selectedDate!);

   setState(() {
   });
  }
}
