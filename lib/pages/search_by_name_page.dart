import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/blocs/search_by_name_bloc.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/pages/seven_days_forecast_page.dart';
import 'package:weather_app/resources/colors.dart';
import 'package:weather_app/resources/dimens.dart';
import 'package:weather_app/view_%20items/detail_title_view.dart';
import 'package:weather_app/view_%20items/period_temperature_view.dart';
import 'package:weather_app/view_%20items/pop_button_view.dart';
import 'package:weather_app/widgets/tem_min_max.dart';

class SearchByNamePage extends StatelessWidget {

  final bool isNight;

  SearchByNamePage({required this.isNight});

  ///State Variable
  final TextEditingController name = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchByNameBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  (isNight) ? NIGHT_COLOR : DAY_COLOR
                ]
              ),
            ),
            padding: EdgeInsets.only(top: MARGIN_MEDIUM_5,left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    PopButtonView(),
                    SizedBox(height: MARGIN_SMALL_1x,),
                    Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserTextView(
                   nameController: name,
                    formKey: formKey,
                isNight: isNight,
              ),
                Builder(
                  builder: (context) =>
                     SearchButtonView(
                      name: name,
                      isNight: isNight,
                      onClick: (){
                        if(formKey.currentState!.validate()){
                         SearchByNameBloc _bloc = Provider.of(context,listen: false);
                          _bloc.searchByName(name.text);
                  }
                      },
                   ),
                  ),
                 ],
               ),
                    SizedBox(height: MARGIN_MEDIUM_3X,),
                    Selector<SearchByNameBloc,SysVO>(
                      selector: (context,bloc) => bloc.byNameData ?? SysVO.emptySituation(),
                      shouldRebuild: (previous,next) => previous != next,
                      builder: (context,byNameData,child) =>
                      (name.text.isEmpty) ? Container() :
                       (byNameData==null) ?   Container() :  
                       Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           (byNameData == null) ? Container() : 
                            IconView(
                              byNameData: byNameData,
                            ),
                            SizedBox(height: MARGIN_SMALL_1x,),
                            WeatherView(
                              isNight: isNight,
                              byNameData: byNameData,
                              ),
                              SizedBox(height: MARGIN_SMALL_1x,),
                              TempView(
                                isNight: isNight,
                                byNameData: byNameData,
                                ),
                         ],
                       )
                      ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}


class TempView extends StatelessWidget {
  const TempView({
    Key? key,
    required this.isNight,
    required this.byNameData,
  }) : super(key: key);

  final bool isNight;
  final SysVO byNameData;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DetailTitleView(
            title: "Temperature",
          ),
          SizedBox(height: MARGIN_SMALL_1x,),
          Container(
            width: double.infinity,
            height: SEARCH_BY_NAME_TEMPERATURE_CONTAINER_HEIGHT,
            margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3X_EXTRA),
            padding: EdgeInsets.all(MARGIN_MEDIUM_3X_EXTRA),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3X_EXTRA),
            ),
            child: TempMinMaxView(
              isNight: isNight,
              day: DailyVO.emptySituation(),
              byNameData: byNameData,
              isSearch: true,
              ),
          ),
        ],
      );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
    required this.isNight,
    required this.byNameData,
  }) : super(key: key);

  final bool isNight;
  final SysVO byNameData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailTitleView(title: "Conditon"),
        SizedBox(height: MARGIN_SMALL_1x,),
        Container(
                    width: double.infinity,
                    height: DETAIL_CONDITION_CONTAINER_HEIGHT,
                    margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2X),
                    padding: EdgeInsets.all(MARGIN_MEDIUM_3X_EXTRA),
                   decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3X_EXTRA),
                        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Weather Condition",
                  temp: "${byNameData.weather?.first.description}",
                  ),
               PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Pressure",
                  temp: "${byNameData.main?.pressure}",
                  ),
                   PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Wind Speed",
                  temp: "${byNameData.wind?.speed}",
                  ),
                   PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Humandity",
                  temp: "${byNameData.main?.humidity}",
                  ),
           ],
         )
           ),
      ],
    );
  }
}

class IconView extends StatelessWidget {
  const IconView({
    Key? key,
    required this.byNameData,
  }) : super(key: key);

  final SysVO byNameData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
              height: DETAIL_PAGE_ICON_CONTAINER_HEIGHT,
            child: Image.network("http://openweathermap.org/img/wn/${byNameData.weather?.first.icon}.png",
       fit: BoxFit.cover,
         ),
                       ),
    );
  }
}


class SearchButtonView extends StatelessWidget {
   SearchButtonView({
    Key? key,
    required this.name,
    required this.isNight,
    required this.onClick,
  }) : super(key: key);

  final TextEditingController name;
  final bool isNight;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
     onPressed: (){
       onClick();
       },
    child: Text("Search",
    style: TextStyle(
      color: (isNight) ? NIGHT_COLOR : DAY_COLOR,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    ),
    );
  }
}

class UserTextView extends StatelessWidget {
  UserTextView({
    Key? key,
    required this.nameController,
    required this.formKey,
    required this.isNight,
  }) : super(key: key);

 final TextEditingController nameController;
 final GlobalKey<FormState> formKey;
 final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
          key: formKey,
        child: TextFormField(
          controller: nameController,
          style: TextStyle(
            color: (isNight) ? NIGHT_COLOR : DAY_COLOR,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(
              color: (isNight) ? NIGHT_COLOR : DAY_COLOR,
            ),
            suffixIcon: IconButton(
              onPressed: (){
                nameController.clear();
              },
             icon: Icon(Icons.cancel,color: (isNight) ? NIGHT_COLOR : DAY_COLOR,)),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 3,color: (isNight) ? NIGHT_COLOR : DAY_COLOR),
              borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
          ),
          validator: (str){
            if(str!.isEmpty){
              return "Required";
            }
            return null;
          },
        ),
      ),
    );
  }
}