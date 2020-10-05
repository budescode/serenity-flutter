import 'package:Ecomme/screens/Home/dashboard.dart';
import 'package:Ecomme/screens/courses/courses.dart';
import 'package:Ecomme/screens/offline/offlinepage.dart';
import 'package:Ecomme/screens/profile/profile.dart';
import 'package:flutter/material.dart';





class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
int currentIndex = 0;
List<Widget> widgets = [Home(), OfflinePage(),ProfilePage()];
void changeIndex(int newIndex) => setState(() => currentIndex = newIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgets[currentIndex],
        bottomNavigationBar: bottomNavbar(
            onTap: changeIndex,
            currentIndex: currentIndex));
  }
}

Widget bottomNavbar({@required onTap, @required currentIndex}) {
  return BottomNavigationBar(
    onTap: onTap,
    currentIndex: currentIndex,
    unselectedLabelStyle: TextStyle(fontFamily: 'product-sans'),
    selectedLabelStyle: TextStyle(fontFamily: 'product-sans'),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black38,
    type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home)),
              new BottomNavigationBarItem(
                  label: 'Offline', icon: new Icon(Icons.offline_bolt_outlined)),
              new BottomNavigationBarItem(
                  label: 'Profile', icon: new Icon(Icons.person)),
              // new BottomNavigationBarItem(
              //     title: new Text('Inquiries'), icon: new Icon(Icons.message)),
            ]
  );
}
