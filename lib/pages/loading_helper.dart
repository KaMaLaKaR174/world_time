import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingHelper extends StatefulWidget {
  @override
  _LoadingHelperState createState() => _LoadingHelperState();
}

class _LoadingHelperState extends State<LoadingHelper> {
  @override
  Widget build(BuildContext context) {
    Map data=ModalRoute.of(context).settings.arguments;
    setUpWorldTime(data['location'],data['flag'],data['url']);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SpinKitRotatingCircle(
        color: Colors.black,
      ),
    );
  }

  void setUpWorldTime(String location,String flag,String url) async{
    WorldTime instance=new WorldTime(location: location,flag: flag,url: url);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });


  }
}
