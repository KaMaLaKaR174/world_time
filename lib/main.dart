import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/init_loading.dart';
import 'package:world_time/pages/loading_helper.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/choose' : (context)=> ChooseLocation(),
    '/load' :(context)=> LoadingHelper(),


  },
));
