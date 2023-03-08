import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubits/Weather_Cubit/weather_cubit.dart';
import 'Pages/home_page.dart';
import 'Services/weather_service.dart';


void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel== null ?  Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}
