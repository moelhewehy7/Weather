class WeatherModel {
  final String cityname;
  final String? image;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;

  WeatherModel(
      {this.image,
      required this.cityname,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromjson(dynamic json) {
    // var jsonData = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']["icon"],
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStateName: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
  String getImage() {
    if (weatherStateName == 'Sunny') {
      return 'assets/images/Leonardo_Diffusion_XL_i_need_a_spring_illiustration_image_for_0.jpg';
    } else if (weatherStateName == 'Clear') {
      return 'assets/images/clear.jpg';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Moderate or heavy showers of ice pellets' ||
        weatherStateName == 'Ice pellets' ||
        weatherStateName == 'Patchy heavy snow' ||
        weatherStateName == 'Patchy light snow' ||
        weatherStateName == 'light snow' ||
        weatherStateName == 'cloudy' ||
        weatherStateName == 'Overcast' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName == 'Moderate or heavy freezing rain' ||
        weatherStateName == 'Light sleet' ||
        weatherStateName == 'Moderate or heavy sleet' ||
        weatherStateName == 'Patchy light snow' ||
        weatherStateName == 'Light snow' ||
        weatherStateName == 'Patchy moderate snow' ||
        weatherStateName == 'Moderate snow' ||
        weatherStateName == 'Patchy heavy snow' ||
        weatherStateName == 'Heavy snow' ||
        weatherStateName == 'Ice pellets') {
      return 'assets/images/Leonardo_Diffusion_XL_i_need_a_winter_illiustration_image_for_0 (1).jpg';
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName == "Moderate rain" ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.jpg';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Light rain shower' ||
        weatherStateName == 'Moderate or heavy rain shower' ||
        weatherStateName == 'Torrential rain shower' ||
        weatherStateName == 'Light sleet showers' ||
        weatherStateName == 'Moderate or heavy sleet showers' ||
        weatherStateName == 'Light snow showers' ||
        weatherStateName == 'Moderate or heavy snow showers' ||
        weatherStateName == 'Light showers of ice pellets' ||
        weatherStateName == 'Moderate or heavy showers of ice pellets' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Mis' ||
        weatherStateName == 'Fog') {
      return 'assets/images/foggy.jpg';
    } else {
      return 'assets/images/autumn 2.jpg';
    }
  }
}
