import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_sercice.dart';

class GetWeatherCubit extends Cubit<Weatherstate> {
  GetWeatherCubit() : super(WeatherInitialState());
    WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherSearvice(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}