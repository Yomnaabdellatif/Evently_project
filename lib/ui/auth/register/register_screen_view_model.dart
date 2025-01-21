import 'package:evently_project/ui/auth/register/register_connector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../firebase_utils.dart';
import '../../../model/user.dart';
import '../../../providers/user_provider.dart';
import '../../../utilities/dialog_utils.dart';
//hold data -handle logic
class RegisterScreenViewModel extends ChangeNotifier{
  late RegisterConnector connector;

 register(String email,String password) async{


  connector.showLoading("LOADING...");
try {
final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
email: email,
password: password,
);
// MyUser user= MyUser(id: credential.user?.uid??"", name: nameController.text, email: emailController.text);
// var userProvider=Provider.of<UserProvider>(_,listen: false);
// userProvider.updateUser(user);
// await FirebaseUtils.addUserToFireStore(user);
  connector.hideLoading();
  connector.showMassage("register successfully");
  connector.navigateToHome();

} on FirebaseAuthException catch (e) {
if (e.code == 'weak-password') {
connector.hideLoading();
connector.showMassage( "The password provided is too weak.");

}
else if (e.code == 'email-already-in-use') {
  connector.hideLoading();
  connector.showMassage("The account already exists for that email.");
}
}

catch (e) {
  connector.hideLoading();
  connector.showMassage(e.toString());

}




}
}


