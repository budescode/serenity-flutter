import 'package:flutter/material.dart';

class StackedIcons extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return new Container(
   child: 
   new Stack(
             children: <Widget>[
             new Container(
               height: 60,
               width: 60.0,
               margin: new EdgeInsets.only(right: 50.0, top: 50.0),
               decoration: new BoxDecoration(
                 borderRadius: new BorderRadius.circular(50.0),
                 color: Colors.green
               ),
               child: new Icon(Icons.home, color: Colors.white,),
             ),
             new Container(
               height: 60,
               width: 60.0,
               margin: new EdgeInsets.only(left: 20.0, top: 10),
               decoration: new BoxDecoration(
                 borderRadius: new BorderRadius.circular(50.0),
                 color: Colors.red
               ),
               child: new Icon(Icons.local_atm, color: Colors.white,),
             ),
             new Container(
               height: 60,
               width: 60.0,
               margin: new EdgeInsets.only(left: 50.0, top: 50.0),
               decoration: new BoxDecoration(
                 borderRadius: new BorderRadius.circular(50.0),
                 color: Colors.blue
               ),
               child: new Icon(Icons.fastfood, color: Colors.white,),
             )
             ]
           ),  
   );
  }}