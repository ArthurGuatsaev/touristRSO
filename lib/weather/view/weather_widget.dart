import 'package:flutter/material.dart';
import 'package:my_webapp/weather/view/bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherWidget extends StatefulWidget {
  final String mainCategory;
  const WeatherWidget({super.key, this.mainCategory = 'restourant'});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    //state.status == WeatherStatus.noNetwork ? SizedBox.shrink() :
    switch (widget.mainCategory) {
      case 'museum':
      case 'suvenirs':
      case 'restourants':
        return const SizedBox.shrink();
      default:
        return BlocBuilder<WeatherBloc, WeatherState>(
            buildWhen: (previous, current) =>
                previous.weather != current.weather,
            builder: (context, state) {
              return const Row(
                children: [
                  DayWeather(
                    weekDay: 'monday',
                    tempr: '23',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DayWeather(
                    weekDay: 'monday',
                    tempr: '23',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DayWeather(
                    weekDay: 'monday',
                    tempr: '23',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              );
            });
    }
  }
}

class DayWeather extends StatelessWidget {
  final String weekDay;
  final String tempr;
  const DayWeather({super.key, required this.tempr, required this.weekDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weekDay),
          Text('$tempr C'),
        ],
      ),
    );
  }
}
