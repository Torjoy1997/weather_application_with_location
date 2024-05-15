import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_with_location/cubit/weather_cubit.dart';
import 'package:weather_with_location/screen/welcome.dart';
import 'package:weather_with_location/service/global_observer.dart';
import 'package:weather_with_location/service/location.dart';
import 'package:weather_with_location/service/weather_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
    fileName: 'assets/.env',
  );
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LocationService(),
          ),
          RepositoryProvider(
            create: (context) => WeatherService(),
          ),
        ],
        child: BlocProvider(
          create: (context) => WeatherCubit(
              context.read<LocationService>(), context.read<WeatherService>()),
          child: const WecomeScreen(),
        ),
      ),
    );
  }
}
