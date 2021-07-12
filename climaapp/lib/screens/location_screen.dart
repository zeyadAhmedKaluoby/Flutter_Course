import 'package:climaapp/screens/city_screen.dart';
import 'package:climaapp/services/networking.dart';
import 'package:climaapp/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climaapp/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;
LocationScreen(this.locationWeather);
  @override
  _LocationScreenState createState() => _LocationScreenState();

}

class _LocationScreenState extends State<LocationScreen> {
  int temp =0;
  WeatherModel weatherModel = WeatherModel();
  String weatherMessage='' ;
  String weatherIcon='' ;
  String city='';
  @override
  void initState() {
    super.initState();
    upUi(widget.locationWeather);
  }
  void upUi(dynamic weatherData) {
    setState(() {
      if(weatherData==null){
        temp=0;
        weatherIcon='Error';
        weatherMessage='unable to get weather data';
        return;
      }

      double temperature = weatherData['main']['temp'];
      temp=temperature.toInt();
      int condition =weatherData['weather'][0]['id'];
      city=weatherData['name'];
      weatherIcon= weatherModel.getWeatherIcon(condition);
      weatherMessage=weatherModel.getMessage(temp);
      print(temp);
      print(condition);
      print(city);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()async {
                     var weatherData= await weatherModel.getLocationWeather();
                      upUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                     var typedName= await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();

                      }));
                     if(typedName !=null || typedName !='')
                       {
                      var weatherData=  await weatherModel.getCityWeather(typedName);
                      upUi(weatherData);
                       }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '$temp',
                        style: kTempTextStyle,
                      ),
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $city!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
