class Event{
  static String collectionName="Event";
String id;
String title;
String description;
String eventName;
String image;
DateTime dateTime;
String time;
bool isFavorite;

Event({
  this.id="",
  required this.title,
  required this.description,
  required this.eventName,
   this.isFavorite=false,
  required this.image,
  required this.time,
  required this.dateTime,




});
Event.fromFireStore(Map<String,dynamic>? data):this(
id:data!["id"] ,
image:data["image"] ,
title:data["title"] ,
time: data["time"],
dateTime:DateTime.fromMillisecondsSinceEpoch(data["dateTime"]) ,
description:data["description"] ,
eventName: data["eventName"],isFavorite: data["isFavorite"]
);

Map<String,dynamic> toFireStore(){
  return{
    "id":id,
    "eventName":eventName,
    "title":title,
    "description":description,
    "dateTime":dateTime.millisecondsSinceEpoch,
    "time":time,
    "image":image,
    "isFavorite":isFavorite,





  };
}


}