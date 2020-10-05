import 'package:Ecomme/screens/Home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'landingpage.dart';

// import 'bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screens/bottomnavbar/bottomnavbar.dart';
import 'screens/courses/providers/course_provider.dart';
import 'screens/onboard/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget widget = await decideFirstWidget();
  runApp(MyApp(widget));

}

class MyApp extends StatefulWidget {
   final Widget widget;
   MyApp(this.widget);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showToast(themsg) {
    Fluttertoast.showToast(
        msg: themsg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),

       
      ],
          child: MaterialApp(
        title: 'Serenity',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'product-sans'),
        home: widget.widget,
      ),
    );
  }
}
Future<Widget> decideFirstWidget() async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  if (token == null || token == 'null'){ 
    return OnBoardingPage();
  }else{
  return BottomNav();}
}