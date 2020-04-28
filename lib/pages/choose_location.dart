import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> worldList=[
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'arab.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Choose Location',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
          ),
        ),
        body: ListView.builder(
            itemCount: worldList.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  onTap: () {
                  WorldTime instance=worldList[index];
//                    await instance.getTime();
                    Navigator.pushReplacementNamed(context, '/load',arguments: {
                      'location': instance.location,
                      'flag': instance.flag,
                      'url': instance.url,
                    });

                  },
                  title: Text(worldList[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${worldList[index].flag}'),

                  ),
                ),
              );
            },
        ),

      ),
    );
  }
}
