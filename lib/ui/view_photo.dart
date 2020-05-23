
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewPhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String picturePath = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: picturePath,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: picturePath,
          ),
        ),
      )
    );
  }
}