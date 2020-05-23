import 'package:flutter/material.dart';
import 'package:gallery/repository/api_repository.dart';
import 'package:gallery/repository/models/photo_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoList extends StatefulWidget {
  final String routViewPhoto;
  final ApiRepository unsplashApi = ApiRepository();

  PhotoList({this.routViewPhoto});

  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  List<PhotoModel> _photoList;
  bool _isPhotos = false;

  Future <void> getPhoto() async {
    _photoList = await widget.unsplashApi.getPhotos();
  }

  void _alreadyGetPhotos() {
    setState(() {
      _isPhotos = true;
    });
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
      backgroundColor: const Color(0xFFF2F2F2),
    );
  }

  Widget _viewPhotoList() {
    return ListView.builder(
        itemCount: _photoList == null ? 0 : _photoList.length,
        itemBuilder: (context, i){
          return _listItem(i);
        }
    );
  }

  Widget _listItem(int i) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, widget.routViewPhoto,
                    arguments: _photoList[i].urls.regular,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Hero(
                      tag: _photoList[i].urls.regular,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _photoList[i].urls.small,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                width: MediaQuery.of(context).size.width - 102,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (_photoList[i].user.name != null)
                      Text(
                        _photoList[i].user.name + "\n",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )
                      ),
                    if (_photoList[i].description != null)
                      Text(_photoList[i].description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}