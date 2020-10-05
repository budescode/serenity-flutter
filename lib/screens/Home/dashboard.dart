import 'package:Ecomme/screens/Home/provider/home_provider.dart';
import 'package:Ecomme/screens/courses/courses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return new Scaffold(

        appBar: AppBar(
            title: Text(''),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: new IconThemeData(
              color: Colors.white,
            ),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text(
                    'Welcome, ${homeProvider.name}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       ),
                  )),
                  new Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image(
                        height: 50,
                        image: AssetImage('images/user.png'),
                      ),
                    ],
                  )),
                ],
              ), //
              new SizedBox(
                height: 20,
              ),
              new Card(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 23, left: 5, right: 8, bottom: 30),
                child: new Column(
                  children: <Widget>[
                    new Row(children: <Widget>[
                      SizedBox(width: 10),
                      new Expanded(
                        child: new Text('Proficiency'),
                      ),
                      new Expanded(
                        child: new Text(
                          'Progress..',
                          textAlign: TextAlign.right,
                        ),
                      )
                    ]),
                    new SizedBox(
                      height: 5,
                    ),
                    new Row(children: <Widget>[
                      SizedBox(width: 10),
                      new Expanded(
                        child: new Text('Courses',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: "product-sans")),
                      ),
                      new Expanded(
                        child: new Container(
                            alignment: Alignment.centerRight,
                            height: 10,
                            //  width:,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: new BorderRadius.circular(5.0))),
                      )
                    ]),
                    new SizedBox(
                      height: 25,
                    ),
                    new Row(children: <Widget>[
                      SizedBox(width: 10),
                      new Expanded(
                          child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => CoursesPage(),
                          ));
                        },
                        child: new Container(
                        height: 45,
                        decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: new BorderRadius.circular(7.0)),
                        alignment: Alignment.center,
                        child: new Text('Resume Lesson',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "product-sans",
                                  color: Colors.white)),
                      ),
                          )),
                      new Expanded(
                        child: new Container(),
                      )
                    ]),
                  ],
                ),
              )),
              new SizedBox(
                height: 12,
              ),
              new Card(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: new BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 23, left: 5, right: 8, bottom: 30),
                  child: new Column(
                    children: <Widget>[
                      new Row(children: <Widget>[
                        SizedBox(width: 10),
                        new Expanded(
                          child: new Text(
                            'Take Test',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        new Expanded(
                          child: new Text(
                            '',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ]),
                      new SizedBox(
                        height: 25,
                      ),
                      new Row(children: <Widget>[
                        SizedBox(width: 11),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              height: 10,
                              //  width:,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      new BorderRadius.circular(5.0))),
                        ),
                      ]),
                    ],
                  ),
                ),
              )),
              new SizedBox(
                height: 12,
              ),
              new Row(children: <Widget>[
                new Expanded(
                  child: new Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(5.0)),
                    child: new Column(
                      children: <Widget>[
                        new SizedBox(
                          height: 15,
                        ),
                        new Text('Saved Offline'),
                        new SizedBox(
                          height: 91,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: new Text(
                                '0',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                              Expanded(
                                  child: new Container(
                                height: 20,
                                width: 20,
                                // child: new Image(
                                //   // height: 50,
                                //   image: AssetImage('images/grey.png'),
                                // ),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                new SizedBox(
                  width: 5,
                ),
                new Expanded(
                  child: new Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(5.0)),
                    child: new Column(
                      children: <Widget>[
                        new SizedBox(
                          height: 15,
                        ),
                        new Text('Lesson Completed'),
                        new SizedBox(
                          height: 91,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: new Text(
                                '0',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                              Expanded(
                                  child: new Container(
                                height: 20,
                                width: 20,
                                // child: new Image(
                                //   // height: 50,
                                //   image: AssetImage('images/grey.png'),
                                // ),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ])
            ]));
  }
}


