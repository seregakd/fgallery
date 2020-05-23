import 'package:flutter/material.dart';
import 'ui/photo_list.dart';
import 'ui/view_photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String routPhotoList = "photoList";
  final String routViewPhoto = "viewPhoto";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery',
      initialRoute: routPhotoList,
      routes: {
        routPhotoList:(context) => PhotoList(routViewPhoto: routViewPhoto),
        routViewPhoto:(context) => ViewPhoto(),
      },
    );
  }
}