//import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter_weather_icons/flutter_weather_icons.dart';
//import "package:http/http.dart";
//import 'package:gradient_app_bar/gradient_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
  /*String username = "";

  Future<void> getdata() async {
    // my teacher used void only but i have to use Future<void>
    await Future.delayed(Duration(seconds: 2), () {
      username = "NIKHIL";
    });
  }

  void showdata() async {
    await getdata();
    print("$username");
  }*/

  /*void timer() {
    Future.delayed(Duration(seconds: 3), () {
      print("alarm is ringing");
    });
    print("you can do other stuffs too");
  }*/
  /*  void getdata() async {
    Response response = await get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/1"),
    );

    Map data = jsonDecode(response.body); // Fixed jsonDecode usage
    print(data);
    //print("");
    //print(data['date']); // Accessing 'date' field correctly
    print(data['id']);
  }
*/
  /*  void getdata() async {
    Response response = await get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Raipur&appid=7d5e85c25ba0e59595525b8946565c69",
      ),
    );
    Map data = jsonDecode(response.body);
    //Map temp_data = data['main'];
    //double temp = temp_data['temp'];
    //print(temp);

    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    print(weather_data);
    print(weather_main_data['main']);
  }
*/
  // int counter = 1;
  @override
  void initState() {
    super.initState();
    //timer();
    //showdata();
    //getdata();
    //getdata();
    print("this is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    super.dispose();
    print("widget destroyed");
  }

  @override
  Widget build(BuildContext context) {
    //Map info = ModalRoute.of(context)!.settings.arguments as Map;

    var cityName = [
      "Mumbai",
      "Delhi",
      "Chennai ",
      "Raipur",
      "Indore",
      "London",
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    Map<dynamic, dynamic> info =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    String icon1 = info['icon_value'].toString();
    //print(icon1);
    String iconurl = "http://openweathermap.org/img/wn/$icon1@2x.png";
    String getCity = info['city_value'];
    String hum = info['hum_value'];

    String des = info['des_value'];
    String tempValue = info['temp_value'].toString();
    String temp1 = tempValue.length >= 4
        ? tempValue.substring(0, 4)
        : tempValue;
    String airValue = info['air_speed_value'].toString();
    String air = airValue.length >= 2 ? airValue.substring(0, 2) : airValue;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 154, 197, 232),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            //color: Colors.red,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
        
                stops: [0.3, 0.9],
                colors: [
                  const Color.fromARGB(255, 107, 176, 233),
                  const Color.fromARGB(255, 3, 58, 103),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  //color: Colors.grey,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      //Icon(Icons.search),
                      GestureDetector(
                        onTap: () {
                          if ((searchcontroller.text).replaceAll(" ", "") == "") {
                            print("BLANK SEARCH");
                          }
                          else{
        
                              Navigator.pushReplacementNamed(
                            context,
                            "/loading",
                            arguments: {"searchText": searchcontroller.text},
                          );
        
                          }
        
            
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: Icon(Icons.search, color: Colors.blueAccent),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(26),
                        child: Row(
                          children: [
                            Image.network(iconurl),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  des,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "In $getCity",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 205,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.device_thermostat),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(temp1, style: TextStyle(fontSize: 90)),
                                Text("C", style: TextStyle(fontSize: 20)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(24, 0, 10, 0),
                        padding: EdgeInsets.all(18),
                        height: 147,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(Icons.wind_power_sharp)],
                            ),
                            SizedBox(height: 10),
                            Text(
                              air,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("km/hr"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 24, 0),
                        padding: EdgeInsets.all(18),
                        height: 147,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(Icons.water_drop_outlined)],
                            ),
                            SizedBox(height: 10),
                            Text(
                              hum,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Percent"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text("Made By Nik"),
                      Text("Data Provided By Openweathermap.org"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
