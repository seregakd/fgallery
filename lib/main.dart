import 'package:flutter/material.dart';
import 'ui/photo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery',
      initialRoute: '/',
      routes: {
        '/':(context) => PhotoList(),
//        'weatherForecast':(context) => WeatherForecast(),
      },
    );
  }
}