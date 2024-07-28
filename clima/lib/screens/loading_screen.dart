import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  @override
  void initState() {
    getLocationData();
    print("this line of code is triggered");

    super.initState();
  }


        void  getLocationData() async {
      WeatherModel weatherModel =WeatherModel();
          var weatherData= await weatherModel.gerLocationWeather();
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return LocationScreen(locationWeather: weatherData,);
          }));
        }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
