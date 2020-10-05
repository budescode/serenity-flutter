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
          backgroundColor: Colors.black,
        ),
        body: courseProvider.loading ?  Center(child: CircularProgressIndicator()) :
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(children:<Widget>[
                                  Image(
                        height: 250,
                        image: AssetImage('images/teacher.png'),
                      ),
            Card(child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(details.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('( ${details.titletranslate} )'),
                  Divider(),
                  Text('WORD :',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 5),
                  Text('${details.word}'),
                  Divider(),
                  Text('Meaning :',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 5),
                  Text('${details.meaning}'),
                ],
              ),
            ))
          ]),
        )
      );
    
  }
}
