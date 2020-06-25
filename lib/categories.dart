import 'package:flutter/material.dart';
import 'products.dart';

void main() => runApp(CategoriesPage());

class CategoriesPage extends StatelessWidget {
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
                new Text("CATEGORIES",
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
      body: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          childAspectRatio: 0.85,
          children: [
            {'image': 'images/p2.jpg', 'name': 'Category1'},
            {'image': 'images/p3.jpg', 'name': 'Category2'},
            {'image': 'images/p4.jpg', 'name': 'Category3'},
            {'image': 'images/p5.jpg', 'name': 'Category4'},
            {'image': 'images/p6.jpg', 'name': 'Category5'},

            // 'images/p3.jpg',
            // 'images/p4.jpg',
            // 'images/p5.jpg',
            // 'images/p6.jpg'
          ].map((item) {
            return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsPage(),
                  ));
            },
              child: Card(
                margin: EdgeInsets.only(top: 10),
                child: Column(children: <Widget>[
                  Image(
                    image: new AssetImage(item['image']),
                    fit: BoxFit.cover,
                    height: 125,
                    width: 147,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold),)
                ]),
              ),
            );
          }).toList()),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({this.title, this.icon});
  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new Card(
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[this.title, this.icon]),
    ));
  }
}
