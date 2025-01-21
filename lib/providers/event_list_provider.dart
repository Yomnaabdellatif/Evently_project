import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/utilities/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../firebase_utils.dart';
import '../model/event.dart';


Map<String, String> toEnglish={};



class EventListProvider extends  ChangeNotifier{
  List<Event> eventList=[];
  int selectedIndex=0;
   List<String> eventNameList=[];
  Event? selectedEvent;
  void setSelectedEvent(Event event) {
    selectedEvent = event;
    notifyListeners();
  }
  void getEventNameList(BuildContext context){
    eventNameList= [
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
    toEnglish={
      AppLocalizations.of(context)!.all: "All",
      AppLocalizations.of(context)!.sports:"Sports",
      AppLocalizations.of(context)!.meeting:"Meeting",
      AppLocalizations.of(context)!.eating:"Eating",
      AppLocalizations.of(context)!.book_club:"Book Club",
      AppLocalizations.of(context)!.birthday:"Birthday",
      AppLocalizations.of(context)!.exhibition:"Exhibition",
      AppLocalizations.of(context)!.work_shop: "Work Shop",
      AppLocalizations.of(context)!.holiday:"Holiday",
      AppLocalizations.of(context)!.gaming:"Gaming"

    };

  }

  List<Event> filterList=[];
  List<Event> favoriteEventList=[];


  getAllEvents(String uId) async{
    QuerySnapshot<Event> querySnapshot =await FirebaseUtils.getEventCollection(uId).get();
    eventList=querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
    filterList=eventList;
    filterList.sort((event1 ,event2){
      return event1.dateTime.compareTo(event2.dateTime);


    });
   notifyListeners();
  }


  getFilterEvents(String uId) async{
    QuerySnapshot<Event> querySnapshot =await FirebaseUtils.getEventCollection(uId).get();
    eventList=querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
    filterList= eventList.where((event){
       return event.eventName==eventNameList[selectedIndex];
    }).toList();
    filterList.sort((event1 ,event2){
      return event1.dateTime.compareTo(event2.dateTime);


    });
    notifyListeners();
  }
  void changeSelectedIndex(int newSelectedIndex,String uId){

    selectedIndex=newSelectedIndex;
    if(selectedIndex==0){
      getAllEvents(uId);}
    else{
      getFilterEvents(uId);}
  }

  void updateIsFavorite(Event event,BuildContext context,String uId ){

  FirebaseUtils.getEventCollection(uId).doc(event.id).update(
      {"isFavorite":!event.isFavorite}).timeout(const Duration(milliseconds: 300),onTimeout: (){
  });
  notifyListeners();
  ToastMassage.toastMsg(msg: AppLocalizations.of(context)!.update_event);
  selectedIndex==0? getAllEvents(uId) : getFilterEvents(uId);
  getFavoriteEvent(uId);

}
  void deleteEvent(String eventId,BuildContext context,String uId ) async {
    FirebaseUtils.getEventCollection(uId).doc(eventId).delete().then((value)
    =>
        ToastMassage.toastMsg(msg: AppLocalizations.of(context)!.updated_event)

    );
    eventList.removeWhere((event) => event.id == event.id);
    filterList = eventList.where((event) {
      return selectedIndex == 0 || event.eventName == eventNameList[selectedIndex];
    }).toList();
    notifyListeners();

  }


  void getFavoriteEvent(String uId) async{
      var querySnapshot =await FirebaseUtils.getEventCollection(uId).orderBy('dateTime').where('isFavorite',isEqualTo: true).
      get();
      favoriteEventList=
      querySnapshot.docs.map((doc){
        return doc.data();
      }).toList();
      notifyListeners();
    }
  void updateEvent(Event event, BuildContext context, String uId) {
    FirebaseUtils.getEventCollection(uId).doc(event.id).update(event.toFireStore()).then((_) {
      ToastMassage.toastMsg(msg: AppLocalizations.of(context)!.updated_event);
      getAllEvents(uId);
    }).catchError((error) {
      print("Failed to update event: $error");
    });
  }

  void updateEventInFirestore(Event event, String uId) async {
      await FirebaseUtils.getEventCollection(uId).doc(event.id).update(event.toFireStore());
      ToastMassage.toastMsg(msg: "update_event");
      notifyListeners();

  }

  void updateSelectedEvent({
    required String title,
    required String description,
    required DateTime dateTime,
    required String time,
    required String eventName,
    required String eventImage,
    required String uId,
    required bool isFavorite
  }) {
    if (selectedEvent != null) {
      selectedEvent!.title = title;
      selectedEvent!.description = description;
      selectedEvent!.dateTime = dateTime;
      selectedEvent!.time = time;
      selectedEvent!.eventName = eventName;
      selectedEvent!.image = eventImage;
      selectedEvent!.isFavorite=isFavorite;
      updateEventInFirestore(selectedEvent!, uId);
      getFavoriteEvent(uId);
      notifyListeners();
    }
  }



}