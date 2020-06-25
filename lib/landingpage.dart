import 'package:flutter/material.dart';
// import 'package:gifted_hands/register.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifted Hands',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'product-sans'),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.red),
        ),
        body: ListView(
            // padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              // new Text('welcome'),
              new Image(
                height: 350,
                image: AssetImage('images/rena.png'),
              ),
              new Center(
                  child: new Text(
                'Ready to start learning?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                    'Learn your native language'),
              ),
              new SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                  },
                  child: new Container(
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(197, 37, 107, 1.0),
                        borderRadius: new BorderRadius.circular(5.0),
                      )),
                ),
              )
            ]));
  }
}
