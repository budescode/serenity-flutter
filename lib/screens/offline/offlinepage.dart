
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class OfflinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Offline'),
          backgroundColor: Colors.black,
        ),
        body:  Center(child: Text('offline')
             
      ),
    );
  }
}
