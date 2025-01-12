import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/model/event.dart';
import 'package:evently_project/model/user.dart';

class FirebaseUtils {
static Future<void> addEventToFireStore(Event event,String uId){
  CollectionReference<Event> collectionRef =getEventCollection( uId);
  DocumentReference<Event> documentRef= collectionRef.doc();
event.id=documentRef.id;
return documentRef.set(event);

}
static CollectionReference<Event> getEventCollection(String uId){

  return getUserCollection().doc(uId).collection(Event.collectionName).
  withConverter<Event>(fromFirestore: (snapshot,options)=>Event.fromFireStore(snapshot.data())
      , toFirestore: (event,_)=>event.toFireStore());
}
static CollectionReference<MyUser> getUserCollection(){
  return FirebaseFirestore.instance.collection(MyUser.collection).
  withConverter(
      fromFirestore: (snapshot,options)=>MyUser.formFireStore(snapshot.data()),
      toFirestore:(user,options)=>user.toFireStore() );
}
static  Future<void> addUserToFireStore(MyUser user){
 return getUserCollection().doc(user.id).set(user);

}
static Future<MyUser?> readUserFromFireStore(String id)async{

 var querySnapShot= await getUserCollection().doc(id).get();
 return querySnapShot.data();
}
}
