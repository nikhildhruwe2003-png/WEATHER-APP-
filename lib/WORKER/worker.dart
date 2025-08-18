import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  String locationCity;

  late String airSpeed;
  late String temp;
  late String humidity;
  late String description;
  late String main;
  late String iCons;
  
  Worker(this.locationCity);

  /*Future<void> getdata() async {
    Response response = await get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$locationCity&appid=7d5e85c25ba0e59595525b8946565c69",
      ),
    );
    Map data = jsonDecode(response.body);

    // getting temp,humidity
    Map tempData = data['main'];
    String getHumidity = tempData['humidity']; 
    double getTemp = tempData['temp'];

    // getting air_speed

    Map wind = data['wind'];
    double getairSpeed = wind['speed'];

    // getting description
    List weatherData = data['weather'];
    Map weathermainData = weatherData[0];
    String getMaindes = weathermainData['main'];
    String getDesc = weathermainData['description'];

    // assigning values

    temp = getTemp.toString();
    humidity = getHumidity.toString();
    airSpeed = getairSpeed.toString();
    description = getDesc;
    main = getMaindes;
  }
  */

  Future<void> getdata() async {
    try {
      Response response = await get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$locationCity&appid=7d5e85c25ba0e59595525b8946565c69",
        ),
      );
      /*

  Map data = jsonDecode(response.body);

  Map tempData = data['main'];
  humidity = tempData['humidity'].toString();    // ✅ Fixed
  temp = tempData['temp'].toString();            // ✅ Fixed

  airSpeed = data['wind']['speed'].toString();    // ✅ Fixed

  Map weathermainData = data['weather'][0];
  main = weathermainData[
  */

      Map data = jsonDecode(response.body);

      // Extract values
      double tempVal = data['main']['temp'] - 273.15;
      int humidityVal = data['main']['humidity'];
      double airSpeedVal = data['wind']['speed'] / 0.27778;
      String mainDesc = data['weather'][0]['main'];
      String desc = data['weather'][0]['description'];
      String icon = data['weather'][0]['icon'];

      // Assign to your variables (converting doubles/ints to strings when needed)
      temp = tempVal.toString();
      humidity = humidityVal.toString();
      airSpeed = airSpeedVal.toString();
      main = mainDesc;
      description = desc;
      iCons = icon;
    } catch (e) {
      humidity = "NA"; // ✅ Fixed
      temp = "NA"; // ✅ Fixed

      airSpeed = "NA"; // ✅ Fixed
      main = "NA";
      description = "can't find data";
      iCons = "03n";
    }
  }
}
