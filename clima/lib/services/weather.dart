import 'package:clima/services/location.dart';
import 'package:clima/services/networking..dart';
const weatherApiKey ='66f7d392a290f377c26f57a78df24488';
const openWeatherMapUrl ='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    var url  = '$openWeatherMapUrl?q=$cityName&appid=$weatherApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> gerLocationWeather() async{
    Location location = Location(latitude: 0, longitude: 0);
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$weatherApiKey&units=metric');

    var weatherData = await networkHelper.getData();
return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
