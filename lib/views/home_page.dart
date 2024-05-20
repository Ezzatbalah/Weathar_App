import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/widget/no_weather.dart';
import 'package:weather_app/views/widget/weather_info.dart';


import 'Search_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Weather"),
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Search();
                  }));
                }),
          ]),
      body:BlocBuilder<GetWeatherCubit,Weatherstate>(
        builder:((context, state){
          if (state is WeatherInitialState){
            return const NoWeatherBody();
          }
          else if(state is WeatherLoadedState){

            return  WeatherInfoBody(
              weather: state.weatherModel,
            );
          }
          else{
            return const Text('Oops there was an error');
          }
        }
        ),
    ));
  }
}
