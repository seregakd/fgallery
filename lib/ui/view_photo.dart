
import 'package:flutter/material.dart';

class ViewPhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String picturePath = ModalRoute.of(context).settings.arguments;
print("picturePath= " + picturePath);

    return Scaffold(
      body: Container (
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          picturePath,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      )
    );
  }

}