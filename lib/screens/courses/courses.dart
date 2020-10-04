// import 'dart:convert';

// import 'package:flutter/gestures.dart';
import 'package:Ecomme/screens/courses/course_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/course_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CourseProvider courseProvider = Provider.of<CourseProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.school),
                text: 'Beginner',
              ),
              Tab(
                icon: Icon(Icons.help),
                text: 'Intermediate',
              ),
              Tab(
                icon: Icon(Icons.help),
                text: 'Advanced',
              ),
            ],
          ),
          title: Text('Courses'),
          backgroundColor: Color.fromRGBO(26, 159, 202, 1.0),
        ),
        body: courseProvider.loading
            ? Center(child: CircularProgressIndicator())
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: courseProvider.refreshController,
        onRefresh: courseProvider.onRefresh,
        onLoading: courseProvider.onLoading,
                          child: TabBarView(
                  children: [
                    //start beginners tab
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(children: <Widget>[
                        Column(
                          children: courseProvider.beginnersList
                              .map(
                                (name) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CourseDetailsPage(
                                            details: name,
                                          ),
                                        ));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Image(
                                            height: 45,
                                            image: AssetImage('images/list.png'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${name.title}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                '${name.titletranslate}',
                                                style: TextStyle(),
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //),
                                ),
                              )
                              .toList(),
                        ),
                      ]),
                    ),
//end beginners tab

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(children: <Widget>[
                        Column(
                          children: courseProvider.intermediateList
                              .map(
                                (name) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CourseDetailsPage(
                                            details: name,
                                          ),
                                        ));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Image(
                                            height: 45,
                                            image: AssetImage('images/list.png'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${name.title}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                '${name.titletranslate}',
                                                style: TextStyle(),
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //),
                                ),
                              )
                              .toList(),
                        ),
                      ]),
                    ),
                    //end intermediate tab

                    //start advanced tab
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(children: <Widget>[
                        Column(
                          children: courseProvider.advancedList
                              .map(
                                (name) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CourseDetailsPage(
                                            details: name,
                                          ),
                                        ));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Image(
                                            height: 45,
                                            image: AssetImage('images/list.png'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${name.title}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                '${name.titletranslate}',
                                                style: TextStyle(
                                                    ),
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //),
                                ),
                              )
                              .toList(),
                        ),
                      ]),
                    ),
                    //end advanced tab
                  ],
                ),
            ),
      ),
    );
  }
}
