import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_with_location/model/weather_status.dart';

import 'package:weather_with_location/utils/grid_layout.dart';

import 'package:weather_with_location/utils/text_design.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weatherStatusList});

  final List<WeatherStatusModel> weatherStatusList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Now',
            style:
                TextDesign.titleMedium.copyWith(color: const Color(0xFF141859)),
          ),
          const SizedBox(
            height: 30,
          ),
          GridLayout(
            itemCount: 4,
            itemBuilder: (_, index) => WeatherMetaData(
              weatherStatusData: weatherStatusList[index],
            ),
            scrollPhysics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }
}

class WeatherMetaData extends StatelessWidget {
  const WeatherMetaData({super.key, required this.weatherStatusData});

  final WeatherStatusModel weatherStatusData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: Color(0xFFe0e0e0), shape: BoxShape.circle),
            child: Icon(
              weatherStatusData.icon,
              color: const Color(0xFF141859),
              size: 28,
            )),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weatherStatusData.title,
              style:
                  TextDesign.captions.copyWith(color: const Color(0xFF141859)),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              weatherStatusData.amountWeather,
              style: TextDesign.titleLarge
                  .copyWith(color: const Color(0xFF141859)),
            )
          ],
        ),
      ],
    );
  }
}
