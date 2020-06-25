import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Bude',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(fontFamily: 'Roboto'),
     home: Home(),

   );
  }}


class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
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
           new Row(
             mainAxisAlignment: MainAxisAlignment.center,             
             children: <Widget>[
               Padding(
                 child: new Text("Quick Bee", style: new TextStyle(fontSize: 30.0),), 
                 padding: new EdgeInsets.all(8.0)
             ,)
           ],),
           new Row(children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
                  child: new GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginPage(), )
                        );
                    },
                    child: new Container(
                    height: 60.0,
                    decoration: new BoxDecoration(
                    color: Colors.green,
                    borderRadius: new BorderRadius.circular(10.0)
                    ),
                    alignment: Alignment.center,
                    child: new Text('Sign In with Email', style: new TextStyle(color: Colors.white, fontSize: 20),),
                    )
                  )

                  )
             )
           ],),
           new Row(children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20, right: 5),
                  child: 
                  new Container(
                  height: 60.0,
                 decoration: new BoxDecoration(
                 color: Color(0XFF4364A1),
                 borderRadius: new BorderRadius.circular(10.0)
               ),
               alignment: Alignment.center,
               child: new Text('FaceBook', style: new TextStyle(color: Colors.white, fontSize: 20),),
             )
                  )
             ),
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10, right: 15),
                  child: 
                  new Container(
                  height: 60.0,
                 decoration: new BoxDecoration(
                 color: Color(0XFFDF513B),
                 borderRadius: new BorderRadius.circular(10.0)
               ),
               alignment: Alignment.center,
               child: new Text('Google', style: new TextStyle(color: Colors.white, fontSize: 20),),
             )
                  )
             ),
           ],)         
       ],)
     ),
   );

   
  }}



  class MyCard extends StatelessWidget {
    MyCard({this.title, this.icon});
    final Widget title;
    final Widget icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            this.title,
            this.icon
          ]
        ),
      )
    );
  }}