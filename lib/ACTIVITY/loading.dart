import 'package:flutter/material.dart';
//import 'package:flutter_application_1/ACTIVITY/location.dart';
import 'package:flutter_application_1/WORKER/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String temperature = "Loading";

  late String airspeed;
  late String temp1;
  late String hum;
  late String des;
  late String main;
  late String ican;
  late String city = "Agartala";

  void startApp(String city) async {
    Worker instance = Worker(city);
    await instance.getdata();
    //print(instance.airSpeed);
    //print(instance.description);
    /*setState(() {
      temperature = instance.temp;
    });*/

    airspeed = instance.airSpeed;
    temp1 = instance.temp;
    hum = instance.humidity;
    des = instance.description;
    main = instance.main;
    ican = instance.iCons;
    Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "temp_value": temp1,
        "hum_value": hum,
        "air_speed_value": airspeed,
        "des_value": des,
        "main_value": main,
        "icon_value": ican,
        "city_value": city,
      },
    );
  }

  @override
  void initState() {
    //startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   Map<dynamic, dynamic> search =
    (ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?) ?? {};
    if (search.isNotEmpty ?? false) {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/—Pngtree—android phone weather icon_4441215.png",
                  height: 240,
                  width: 180,
                ),
                Text("Weather App", style: TextStyle(fontSize: 30)),
                SizedBox(height: 10),
                Text(
                  "Made By Nik",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 255, 248, 248),
                  ),
                ),
                SizedBox(height: 20),
                SpinKitWave(color: Colors.white, size: 30.0),
              ],
            ),
          ),
        ),
      ),
      //backgroundColor: const Color.fromARGB(255, 105, 172, 227),
    );
  }
}
