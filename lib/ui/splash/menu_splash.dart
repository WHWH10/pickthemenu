import 'dart:async';

import 'package:flutter/material.dart';
import '../../ui/home/rm_home.dart';

class MenuSplash extends StatefulWidget {
  @override
  _MenuSplashState createState() => _MenuSplashState();
}

class _MenuSplashState extends State<MenuSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      //  You action here
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => RmHome()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/image/ptm_splash.png', fit: BoxFit.cover,);
  }
}