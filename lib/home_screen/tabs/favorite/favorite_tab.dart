import 'package:evently_project/home_screen/tabs/custom_text_form_field.dart';
import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../providers/app_language_provider.dart';
import '../home/event_item_widget.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(children: [

              Container(
        margin: EdgeInsets.only(top: height*(64/841)),
        padding:  EdgeInsets.symmetric(horizontal: width*(16/393)),
        child: CustomTextFormField(
          prefixIcon: Icon(Icons.search),
          iconColor: AppColors.primaryLight,
          hintStyle: AppStyles.semi16primaryLight,
          borderColor: AppColors.primaryLight,
          hintText: AppLocalizations.of(context)!.search_for_event,
        ),
              ),


              SizedBox(height: height*(16/841),),
              Expanded(child:
              ListView.builder(itemBuilder: (context,index){
        return EventItemWidget();},
        itemCount: 15,))
            ],));
  }
}
