import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '78b09093c255086940965c3964615860';

class WeatherModel {

  Future<dynamic> getcityweather(String city) async{
    var url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey";
    Networking n2 = Networking(url);
    var cityweatherdata = await n2.getdata();
    return cityweatherdata;
  }


  Future<dynamic> getlocationweather() async{
    Location location = Location();
    await location.getcurrentlocation();
    Networking n = Networking(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey");
    var weatherdata = await n.getdata();
    return weatherdata;
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
