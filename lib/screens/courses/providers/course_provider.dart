import 'dart:convert';
import 'package:Ecomme/screens/courses/models/course_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

class CourseProvider with ChangeNotifier {
  CourseProvider() {
    getData();
  }

 RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async{
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    await getData();
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    // setState(() {

    // });
    refreshController.loadComplete();
  }
  bool _loading = false;
  List<CourseModel> _beginnersList;
  List<CourseModel> _intermediateList;
  List<CourseModel> _advancedList;
  bool get loading => _loading;
  List<CourseModel> get beginnersList => _beginnersList;
  List<CourseModel> get intermediateList => _intermediateList;
  List<CourseModel> get advancedList => _advancedList;

  void isLoading(loading) {
    _loading = loading;
    notifyListeners();
  }
  String beginnerUrl = 'https://renatech20.pythonanywhere.com/coursesapi/beginnnerlist/';
  Future<String> getData() async {
    isLoading(true);
     print(beginnerUrl);
    http.Response response = await http.get(
        Uri.encodeFull(beginnerUrl),
        headers: {"Accept": "application/json"});
      
    var data = response.body;
    Map<String, dynamic> details = jsonDecode(data);

    var beginner = details['beginner'];
    var intermediate = details['intermediate'];
    var advanced = details['advanced'];
    var status = details["statusCode"];
    

    List<CourseModel> beg = beginner.map<CourseModel>((data) {
    return CourseModel.fromMap(data);
    }).toList();  
    _beginnersList = beg;

    
    List<CourseModel> inte = intermediate.map<CourseModel>((data) {
    return CourseModel.fromMap(data);
    }).toList();  
    _intermediateList = inte;

    List<CourseModel> adva = advanced.map<CourseModel>((data) {
    return CourseModel.fromMap(data);
    }).toList();  
    _advancedList = adva;



    isLoading(false);

  }
}
