import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setUpWorldTime();

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SpinKitCircle(color: Colors.white,size: 50,),
    );
  }

  void setUpWorldTime() async{
    WorldTime instance=new WorldTime(location: 'Kolkata',flag: 'india',url: 'Asia/Kolkata');
    await instance.getTime();
    time=instance.time;
     Navigator.pushReplacementNamed(context, '/home',arguments: {
       'location': instance.location,
       'flag': instance.flag,
       'time':instance.time,
       'isDay': instance.isDay,
     });
  }
}
