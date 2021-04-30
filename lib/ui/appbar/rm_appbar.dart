import 'package:flutter/material.dart';
import '../../resource/constant.dart';

class RmAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  RmAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      leading: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Image.asset(
          'assets/icon/ptm_icon.png',
          width: 60,
          height: 60,
        ),
      )),
      title: Text(
        'Pick the Menu',
        style: TextStyle(
            color: deepBlueColor, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
