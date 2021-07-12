
import 'package:climaapp/screens/location_screen.dart';
import 'package:climaapp/services/networking.dart';
import 'package:climaapp/services/weather.dart';
import 'package:climaapp/utilities/constants.dart';
import 'package:climaapp/utilities/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    print('init');
    getLocationData();

  }


  void getLocationData() async {

    WeatherModel weatherModel=WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(weatherData);}));

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
