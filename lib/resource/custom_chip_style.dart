import 'package:flutter/material.dart';

import 'constant.dart';

class CustomChipStyle extends StatefulWidget {
  final String selectMenu;
  final int index;

  const CustomChipStyle({Key key, this.selectMenu, this.index})
      : super(key: key);

  @override
  CustomChipStyleState createState() => CustomChipStyleState();
}

class CustomChipStyleState extends State<CustomChipStyle> {
  List<String> _categoryList = [
    'assets/icon/category/all.png',
    'assets/icon/category/rice.png',
    'assets/icon/category/kimbap.png',
    'assets/icon/category/noodle.png',
    'assets/icon/category/hamburger.png',
    'assets/icon/category/pizza.png',
    'assets/icon/category/sushi.png'
  ];

  bool _chipSelected = false;

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            print('MENU NAME ---- ${widget.selectMenu}');
            setState(() {
              _chipSelected = !_chipSelected;
            });
          },
          child: Chip(
            backgroundColor: _chipSelected ? Colors.grey: white,
            avatar: Image.asset(_categoryList[widget.index]),
            label: Text(widget.selectMenu, style: TextStyle(color: deepBlueColor),),
            deleteIcon: Icon(Icons.cancel),
            shape: StadiumBorder(side: BorderSide()),
            elevation: 3,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          // child: Text(
          //   widget.selectMenu,
          //   style: TextStyle(color: Constant.white),
          // ),
        ),
      ),
    );
  }
}
