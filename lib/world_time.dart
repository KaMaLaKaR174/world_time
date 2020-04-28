import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    try{
      Response response= await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      DateTime dateTime=DateTime.parse(data['datetime']);
      String offset=data['utc_offset'];
      //print(offset);
      bool isNeg=(offset[0]=='-')?true:false;
      if(isNeg){
        dateTime=dateTime.subtract(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,6))));
      }
      else
      dateTime=dateTime.add(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,6))));

      isDay=dateTime.hour > 5 && dateTime.hour < 18?true:false;
      time=DateFormat.jm().format(dateTime);
      //print(time);
    }
    catch(e){
      print('error caught');
      time='couldnot load time';
    }



  }
}

//http://worldtimeapi.org/timezone/Asia/Kolkata