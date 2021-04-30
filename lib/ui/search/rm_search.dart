import 'package:flutter/material.dart';
import 'package:random_menu/resource/constant.dart';

class RmSearch extends StatefulWidget {
  final String result;

  const RmSearch({Key key, this.result}) : super(key: key);

  @override
  _RmSearchState createState() => _RmSearchState();
}

class _RmSearchState extends State<RmSearch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(''),
        iconTheme: IconThemeData(
          color: black, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
      ),
    );
  }
}
