// import 'dart:convert';

// import 'package:flutter/gestures.dart';
import 'package:Ecomme/screens/courses/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/course_provider.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class CourseDetailsPage extends StatelessWidget {
  final CourseModel details;
  CourseDetailsPage({Key key, this.details}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CourseProvider courseProvider = Provider.of<CourseProvider>(context);
    return  Scaffold(
        appBar: AppBar(
          // bottom: TabBar(
          //   tabs: [
          //     Tab(
          //       icon: Icon(Icons.school),
          //       text: 'Beginner',
          //     ),
          //     Tab(
          //       icon: Icon(Icons.help),
          //       text: 'Intermediate',
          //     ),
          //     Tab(
          //       icon: Icon(Icons.help),
          //       text: 'Advanced',
          //     ),
          //   ],
          // ),
          title: Text('Course Details'),
          backgroundColor: Color.fromRGBO(26, 159, 202, 1.0),
        ),
        body: courseProvider.loading ?  Center(child: CircularProgressIndicator()) :
        ListView(children:<Widget>[
          Text(details.title)
        ])
      );
    
  }
}
