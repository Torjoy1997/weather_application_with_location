import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_location/cubit/weather_cubit.dart';
import 'package:weather_with_location/screen/weather_app.dart';
import 'package:weather_with_location/utils/snack_bar.dart';
import 'package:weather_with_location/utils/text_design.dart';

class WecomeScreen extends StatelessWidget {
  const WecomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadedState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => WeatherApp(
                    weatherData: state.weatherData,
                  )));
        }
      },
      child: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherErrorState) {
            showErrorSnackBar(context, msg: state.errorMessage);
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF141859),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to the Weather App',
                      style: TextDesign.headLineMedium,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Please share your current location to get the weather in your area",
                      style: TextDesign.titleMedium
                          .copyWith(fontWeight: FontWeight.normal),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<WeatherCubit>().fetchWeatherUpdate();
                      },
                      icon: const Icon(
                        CupertinoIcons.location_fill,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Share Current location',
                        style: TextDesign.titleMedium
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
