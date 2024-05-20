class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double? tamp;
  final double? maxTamp;
  final double? minTamp;
  final String? condition;
  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.condition,
      required this.minTamp,
      required this.maxTamp,
      required this.tamp});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        minTamp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTamp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        tamp: json['forecast']['forecastday'][0]['day']['avgtemp_c']);
  }
}
