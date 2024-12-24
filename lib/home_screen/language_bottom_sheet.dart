import 'package:evently_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/app_language_provider.dart';
import '../utilities/app_styles.dart';

class LanguageBottomSheet extends StatefulWidget {


  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding:  EdgeInsets.all(height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(onTap: (){
            languageProvider.changeLanguage("en");

          },
            child:    languageProvider.appLanguage=="en" ?
            getSelectedItemWidget(AppLocalizations.of(context)!.english)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
            ,

          )
          ,SizedBox(height: height*0.02,)
          ,InkWell(onTap: (){
            languageProvider.changeLanguage("ar");

            },
            child:
            languageProvider.appLanguage=="ar" ?
            getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
            ,


          )


        ],),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.bold20primaryLight),
        Icon(Icons.check,color: AppColors.primaryLight,),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,style: AppStyles.bold20Black)
    ;
  }
}
