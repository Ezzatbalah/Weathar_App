import 'package:weather_app/models/weather_model.dart';

class Weatherstate {}

class WeatherInitialState extends Weatherstate {}

class WeatherLoadedState extends Weatherstate {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends Weatherstate {}
