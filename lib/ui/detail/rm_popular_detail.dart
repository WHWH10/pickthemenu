import 'dart:html';

import 'package:flutter/material.dart';
import 'package:random_menu/resource/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RmPopularDetail extends StatefulWidget {
  final String tag, name;

  const RmPopularDetail({Key key, this.tag, this.name}) : super(key: key);

  @override
  _RmPopularDetailState createState() => _RmPopularDetailState();
}

class _RmPopularDetailState extends State<RmPopularDetail> {
  bool _isLiked = false;
  SharedPreferences _prefs;
  String likeKey = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLikeButtonShared(widget.name);
  }

  getLikeButtonShared(name) async {
    _prefs = await SharedPreferences.getInstance();
    likeKey = name;
    setState(() {
      _isLiked = _prefs.getBool(likeKey) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(widget.name, style: TextStyle(color: black),),
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(
          color: black, //change your color here
        ),
        actions: [
          _isLiked
              ? IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  color: mainColor)
              : IconButton(
                  icon: Icon(Icons.favorite_outline),
                  color: black,
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  })
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Hero(
                tag: widget.tag,
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Card(
                      color: white,
                      child: Image.network(
                        widget.tag,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
