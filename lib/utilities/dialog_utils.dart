import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading (
  {required BuildContext context, required String message}
){

    showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
         return AlertDialog(
           content: Row(

             children: [
               CircularProgressIndicator(),
               Padding(padding: EdgeInsets.all(15),child: Text(message,style: AppStyles.semi16Black,),)
             ],
           ),
         );
    });
  }
  static void hideLoading(BuildContext context){
    Navigator.pop(context);
  }
  static void showMessage(
      {required BuildContext context,
        required String message,
        String title="",
        String? posActionName,
        String? negActionName,
        Function? negAction,
        Function? posAction,

      }){
    List<Widget> actions=[];
    if(posActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      }, child: Text(posActionName,style: AppStyles.semi16Black)
      ));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();

      }, child: Text(negActionName,style: AppStyles.semi16Black)
      ));
    }

    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(title,style: Theme.of(context).textTheme.titleLarge,),
        content: Text(message,style: AppStyles.semi16Black,),
        actions: actions,
      );
    });

  }


}