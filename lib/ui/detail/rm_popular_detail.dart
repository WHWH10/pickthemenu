import 'package:flutter/material.dart';
import 'package:random_menu/resource/constant.dart';

class RmPopularDetail extends StatefulWidget {
  final String tag;

  const RmPopularDetail({Key key, this.tag}) : super(key: key);

  @override
  _RmPopularDetailState createState() => _RmPopularDetailState();
}

class _RmPopularDetailState extends State<RmPopularDetail> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(
          color: black, //change your color here
        ),
        actions: [
          !_isLiked
              ? IconButton(
                  icon: Icon(Icons.favorite_outline),
                  color: black,
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  color: mainColor
                )
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
