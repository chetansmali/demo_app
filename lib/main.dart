import 'package:demo_app/pages/choose_location.dart';
import 'package:demo_app/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/pages/home.dart';


void main() => runApp(MaterialApp(
  //This is used to remove Debug sticker form AppBar
  debugShowCheckedModeBanner: false,
  //Creating routes for change the sreens
  initialRoute: '/',//first this screen will load
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context)=>Home(),
    '/chooselocation' :(contex) =>ChooseLocation(),
  },
)
);

