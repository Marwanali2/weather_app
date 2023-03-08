import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/Pages/search_page.dart';

import '../Cubits/weather_cubit/weather_state.dart';
import '../models/weather_model.dart';


class HomePage extends StatelessWidget {


  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    //   weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchPage(
                  //  updateUi: updateUi,
                  );
                },
              ),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
            weatherData=BlocProvider.of<WeatherCubit>(context).weatherModel;
            return successWidget(context: context,weatherData: weatherData!);
          } else if (state is WeatherFailureState) {
            return Center(child: Text("There\'s an error please try again !",style: TextStyle(fontSize: 20),));
          } else {
            return initialWidget(context);
          }
        },
      ),
    );
  }

  Center initialWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'There is no weather 🤔 ',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Start searching now 👇',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchPage(
                  );
                },
              ),
            ),
            child: const Text(
              'Start',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container successWidget({required BuildContext context,required WeatherModel weatherData}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor().shade300,
            weatherData!.getThemeColor().shade200,
            weatherData!.getThemeColor().shade100,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            '${BlocProvider.of<WeatherCubit>(context).cityName}',
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            'Date : ${weatherData!.date.replaceFirst(' ', ' at ')}',
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(weatherData!.getImage()),
              const Text('30', style: TextStyle(fontSize: 35)),
              Column(
                children: [
                  Text('max : ${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(fontSize: 20)),
                  Text('min : ${weatherData!.minTemp.toInt()}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(weatherData!.weatherCondition,
              style:
                  const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          const Spacer(
            flex: 5,
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchPage(

                  );
                },
              ),
            ),
            child: const Text(
              'Research ♻',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}