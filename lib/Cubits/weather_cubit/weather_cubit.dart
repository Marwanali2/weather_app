
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherService) : super(WeatherInitialState());
  WeatherModel? weatherModel;
  String? cityName;
  WeatherService _weatherService;

  void getWeather({required cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await _weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
