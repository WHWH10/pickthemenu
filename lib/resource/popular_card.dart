import 'package:flutter/material.dart';
import 'package:random_menu/resource/constant.dart';
import 'package:random_menu/ui/detail/rm_popular_detail.dart';

class PopularCard extends StatefulWidget {
  final String imageUrl;

  const PopularCard({Key key, this.imageUrl}) : super(key: key);

  @override
  PopularCardState createState() => PopularCardState();
}

class PopularCardState extends State<PopularCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 200,
      width: 250,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RmPopularDetail(tag: widget.imageUrl)),
          );
        },
        child: Hero(
          tag: widget.imageUrl,
          child: Card(
            color: white,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
