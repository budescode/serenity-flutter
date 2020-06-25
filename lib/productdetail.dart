import 'package:flutter/material.dart';

void main() => runApp(ProductDetailsPage());

class ProductDetailsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.red,
          //  elevation: 0.0,
          actions: <Widget>[
            Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 13),
                  new Icon(Icons.arrow_back, color: Colors.white),
                  new SizedBox(width: 13),
                  new Text("DETAILS",
                      style: new TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
            ),
            new IconButton(
              icon: Icon(Icons.search, color: Colors.white),
            ),
            new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ],
          iconTheme: new IconThemeData(color: Colors.red),
        ),
        body: ListView(
          children: <Widget>[
            new Card(
              child: Image(
                image: new AssetImage('images/p8.jpg'),
                fit: BoxFit.cover,
                height: 210,
                // width: 147,
              ),
            ),
            SizedBox(height: 5),
            new Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(height:5),
                    Text(
                      'Product Name',
                      style: new TextStyle(
                          // fontWeight: FontWeight.bold,

                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      children: <Widget>[
                        Text(
                          'Brand:  ',
                          style: new TextStyle(fontSize: 12),
                        ),
                        Text(
                          'My brand:',
                          style: new TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('# 1, 500',
                        style: new TextStyle(
                            fontSize: 20,
                            // color: Colors.red,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: <Widget>[
                      // SizedBox(height: 5,),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: new Container(
                                child: new Text(
                          '(4 star rating)',
                          style: new TextStyle(
                            fontSize: 12,
                          ),
                        ))),
                        Expanded(
                          child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 23,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                new Icon(
                                  Icons.share,
                                  color: Colors.red,
                                  size: 23,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text('DELIVERY AND RETURNS INFO')
            ]),
            SizedBox(height: 5),
            new Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: new Column(children: <Widget>[
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Icon(Icons.assignment_return, color: Colors.red),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // alignment: Alignment.topRight,
                            child: Text("REIMENT",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text("Delivered within all states in India")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Icon(Icons.motorcycle, color: Colors.red),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // alignment: Alignment.topRight,
                            child: Text("Delivered Information",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text("Delivered between tuesday Apr 15 - wed Apr 15")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Icon(Icons.assignment_return, color: Colors.red),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // alignment: Alignment.topRight,
                            child: Text("Privacy Policy",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text(
                              "Free returns within the first 15 days for items..")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ]),
              ),
            ),
            SizedBox(height: 5),
            Row(children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text('PRODUCT DETAILS')
            ]),
            SizedBox(height: 5),
            new Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.red,
                        ),
                      )),
                    ],
                  ),
                  Container(
                    child: new Text('-'),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: new Text('High quality'),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: new Text('Durable'),
                    alignment: Alignment.centerLeft,
                  ),
                ]),
              ),
            ),
            SizedBox(height: 5),
            Row(children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text('SELLER INFORMATION')
            ]),
            SizedBox(height: 5),
            new Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        child: Text(
                          'BUDESCODE',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.red,
                        ),
                      )),
                    ],
                  ),
                  Container(
                    child: new Text('-'),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: new Text('+2349032841265'),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: new Text('20, Uniben backyard opposite BDPA'),
                    alignment: Alignment.centerLeft,
                  ),
                ]),
              ),
            ),
            SizedBox(height: 5),
            Row(children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text('CUSTOMERS FEEDBACK')
            ]),
            SizedBox(height: 5),
            new Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        child: Text(
                          'Ratings & Reviews',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.red,
                        ),
                      )),
                    ],
                  ),
                  Container(
                    child: new Text('(4 Ratings)'),
                    alignment: Alignment.centerLeft,
                  ),
                  Row(
                    children: <Widget>[
                     Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                     Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                     Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                     Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                     Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                     
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('I like it',)
                          ),
                      ),
                      Expanded(
                          child: Container(
                          alignment: Alignment.centerRight,
                          child: Text('-By Budescode', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
                          ),
                      ),
   
                    ]
                  )

                ]),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: Row(
                children: <Widget>[
                  new Container(
                    height: 45,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: new Icon(Icons.call, color: Colors.white),
                  ),
                  new SizedBox(width: 10),
                  new Container(
                      height: 45,
                      width: 280,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: new Row(children: <Widget>[
                        SizedBox(width: 15),
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(width: 45),
                        new Text(
                          'ADD TO CART',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ])),
                ],
              )),
            ],
          ),
        ));
  }
}
