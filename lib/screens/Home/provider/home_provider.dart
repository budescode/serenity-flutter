import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    getData();
  }

  String _name='';
  String get name => _name;  
 
  Future<String> getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String getname = prefs.getString('fullname');
  _name = getname;
  print(getname);
  print('yeahhh');
  notifyListeners();
  }
}
