import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    //print(data);
    String bgimage=data['isDay']?'day.jpg':'night.jpg';


    //$bgimage
    //night.jpg
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/choose');
                  },
                      icon: Icon(Icons.location_on,color: data['isDay']?Colors.black:Colors.white,), label: Text('Choose location',
                      style: TextStyle(
                        color: data['isDay']?Colors.black:Colors.white,
                      ),

                    ),),
                  SizedBox(height: 20,),
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                    color: data['isDay']?Colors.black:Colors.white,
                  ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['time'],
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: data['isDay']?Colors.black:Colors.white,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )

    );
  }
}

