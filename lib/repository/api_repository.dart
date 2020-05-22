import 'dart:async';
import 'package:dio/dio.dart';
import 'models/photo_list_model.dart';

class ApiRepository {
  static const String CLIENT_ID = "oXKM8Z0bq_-prfkt7Rcbveb1k_vxXplj7h7rKKbu9Cc";
  static const BASE_URL = 'https://api.unsplash.com/photos';

  Future <List<PhotoModel>> getPhotos() async {
    final url = '$BASE_URL/?client_id=$CLIENT_ID';

    try {
      Response response = await Dio().get(url);

      if (response.statusCode != 200) {
        print(response.statusCode.toString() + " unable to fetch photo");
        return null;
      }

      print ("response.data= " + response.data.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
    return null;
  }
}