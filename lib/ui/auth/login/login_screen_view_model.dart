import 'package:evently_project/ui/auth/login/login_connector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart.';
import '../../../firebase_utils.dart';

class   LoginScreenViewModel extends ChangeNotifier{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  late LoginConnector connector;
  var formKey = GlobalKey<FormState>();

  login() async{
    if (formKey.currentState?.validate() == true) {
    connector.showLoading("LOADING.....");

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      var user = await FirebaseUtils.readUserFromFireStore(
          credential.user?.uid ?? "");
      if (user == null) {
        return;
      }
      // var eventListProvider = Provider.of<EventListProvider>(
      //     context, listen: false);
      //
      // var userProvider = Provider.of<UserProvider>(context, listen: false);
      // userProvider.updateUser(user);
   connector.hideLoading();
   connector.showMassage("login successfully");
   connector.navigateToHome();
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        connector.hideLoading();
        connector.showMassage("No user found for that email");

      } else if (e.code == 'wrong-password') {
        connector.hideLoading();
        connector.showMassage("Wrong password provided for that user.");

      } else if (e.code == 'invalid-credential') {
        connector.hideLoading();
        connector.showMassage("not found this email");

      }
      else if (e.code == 'network-request-failed') {
        connector.hideLoading();
        connector.showMassage("network error");
      }
    }
    catch (e) {
      connector.hideLoading();
      connector.showMassage(e.toString());

    }

  }
}}