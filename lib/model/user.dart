class MyUser {
  static const String collection="users";
  String id;

  String name;
  String email;
  MyUser({required this.id,required this.name,required this.email});

//object to json
  MyUser.formFireStore(Map<String,dynamic>? data ) :this(
    id: data!["id"],email: data["email"],name: data["name"]
  );
Map<String,dynamic> toFireStore(){

  return {"id":id,"name":name,"email":email
  };
}


}