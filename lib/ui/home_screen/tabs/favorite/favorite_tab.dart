import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../model/event.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../providers/event_list_provider.dart';
import '../../../../providers/user_provider.dart';
import '../../event_details.dart';
import '../custom_text_form_field.dart';
import '../home/event_item_widget.dart';

class FavoriteTab extends StatefulWidget {

  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
TextEditingController searchText=TextEditingController();

List<Event> favoriteEvents=[];
List<Event> filteredFavoriteEvents=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchText.addListener((){
      setState(() {
        filteredFavoriteEvents = favoriteEvents.where((event){
        return event.title.toLowerCase().contains(searchText.text.toLowerCase());}).toList();
      });

    });
  }

  @override

  Widget build(BuildContext context) {
    var eventListProvider= Provider.of<EventListProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    bool isLight = themeProvider.appTheme == ThemeMode.light;

    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var userProvider=Provider.of<UserProvider>(context);

    if(eventListProvider.favoriteEventList.isEmpty) {
      eventListProvider.getFavoriteEvent(userProvider.currentUser!.id);

    }
    favoriteEvents=eventListProvider.favoriteEventList;
    if (searchText.text.isEmpty) {
      filteredFavoriteEvents = favoriteEvents;
    }


    return Scaffold(
        body: Column(children: [
              Container(
        margin: EdgeInsets.only(top: height*(64/841)),
        padding:  EdgeInsets.symmetric(horizontal: width*(16/393)),
        child: CustomTextFormField(
          controller:searchText,
          prefixIcon: const Icon(Icons.search),
          iconColor: AppColors.primaryLight,
          hintStyle: AppStyles.semi16primaryLight,
          textStyle: isLight? AppStyles.semi16primaryLight:AppStyles.semi16LightGray,
          borderColor: AppColors.primaryLight,
          hintText: AppLocalizations.of(context)!.search_for_event,
        ),
              ),


              SizedBox(height: height*(16/841),),
              Expanded(child:
              filteredFavoriteEvents.isEmpty
                  ? Center(child: Text(AppLocalizations.of(context)!.not_found_favorite_items,style:
                isLight? AppStyles.semi16Black:AppStyles.semi16LightGray
                ,))
                  :
              ListView.builder(itemBuilder: (context,index){
                return InkWell(onTap: (){
                  final event = filteredFavoriteEvents[index];
                  eventListProvider.setSelectedEvent(event);
                  Navigator.pushNamed(context, EventDetails.routeName);

                },
                    child: EventItemWidget(event: filteredFavoriteEvents[index],));},
                itemCount: filteredFavoriteEvents.length,),

              )


        ],));

  }


}
