import 'package:flutter/material.dart';
import 'productdetail.dart';

void main() => runApp(ProductsPage());

class ProductsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
  final double itemHeight = (size.height - kToolbarHeight - 24) /2;
  final double itemWidth = size.width / 2;
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
                new Text("PRODUCTS",
                    style: new TextStyle(color: Colors.white, fontSize: 17))
              ],
            ),
          ),
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
          ),
          new IconButton(
            icon: Icon(Icons.sort, color: Colors.white),
          ),
          new IconButton(
            icon: Icon(Icons.view_list, color: Colors.white),
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
        iconTheme: new IconThemeData(color: Colors.red),
      ),
      body: GridView.count(
          childAspectRatio: 0.7,
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          //MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /4),
          crossAxisSpacing: 7,
          children: [
            {'image': 'images/p2.jpg', 'name': 'Product 1'},
            {'image': 'images/p3.jpg', 'name': 'Product 2'},
            {'image': 'images/p4.jpg', 'name': 'Product 3'},
            {'image': 'images/p5.jpg', 'name': 'Product 4'},
            {'image': 'images/p6.jpg', 'name': 'Product 5'},
          ].map((item) {
            return GestureDetector(
            onTap: () {
              // print(itemWidth/itemHeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(),
                  ));
            },
              child: Card(
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
                  Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5),
                  Row(children: <Widget>[
                    Expanded(child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Icon(Icons.star, color: Colors.orange, size:20),
                        Text('4.0'),
                        // Container(
                        //   alignment: Alignment.bottomRight,
                        //   child: Text('# 4,000', textAlign: TextAlign.right,)
                        // )
                      ],
                    )),
                    Expanded(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Icon(Icons.add_shopping_cart, color: Colors.orange, size:20),
                         SizedBox(width: 10,),
                        // Text('#4, 000'),
                        // Container(
                        //   alignment: Alignment.bottomRight,
                        //   child: Text('# 4,000', textAlign: TextAlign.right,)
                        // )
                      ],
                    )),
                  ],),
                  SizedBox( height: 5,),
                  Text('#4000', style: TextStyle(color: Colors.black),),
                ]),
              ),
            );
          }).toList()),
    );
  }
}
