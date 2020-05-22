import 'package:flutter/material.dart';
import 'package:gallery/repository/api_repository.dart';
import 'package:gallery/repository/models/photo_list_model.dart';

class PhotoList extends StatefulWidget {
  final ApiRepository unsplashApi = ApiRepository();

  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  List<PhotoModel> _photoList;
  bool _isPhotos = false;

  Future <void> getPhoto() async {
    _photoList = await widget.unsplashApi.getPhotos();

    for(var item in _photoList) {
      print("item= " + item.description + ", " + item.altDescription + ", " + item.user.name);
    }
  }

  void _alreadyGetPhotos() {
    setState(() {
      _isPhotos = true;
    });

//    Navigator.pushReplacementNamed(context, '/weatherForecast',
//      arguments: DataFromJson(itemsList, usersMap),
//    );
  }

  @override
  void initState(){
    super.initState();

    Future.wait([
      getPhoto(),
    ]).then((List result) => _alreadyGetPhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View photo list"),
      ),
      body: (_isPhotos)
      ? _viewPhotoList()
      : Center(
        child: CircularProgressIndicator(),
    ),
    );
  }

  Widget _viewPhotoList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _photoList == null ? 0 : _photoList.length,
//        cacheExtent: 100,
        itemBuilder: (context, i){
          return _ListItem(i);
        }
    );
  }

  Widget _ListItem(int i) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(_photoList[i].user.name + " " + _photoList[i].user.lastName + " " + _photoList[i].description),
        ],
      ),
    );
  }

}