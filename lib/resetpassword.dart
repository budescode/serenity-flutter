import 'dart:convert';

import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'bottomnav.dart';
import 'package:http/http.dart';
// import 'package:loading/loading.dart';
// import 'package:loading/indicator/ball_pulse_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifted Hands',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'product-sans'),
      home: ResetPassword(),
    );
  }
}

class ResetPassword extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
@override
void initState() {
  print('yeahhhhh');
  super.initState();
  }
  var sent = false; // this will check if activation code has been sent to know what to display.
  var codereceived = ''; //this will check if the code sent to email is the same to the one input
    void showToast(themsg) {
    Fluttertoast.showToast(
        msg: themsg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  String email = '';
  String token = '';
  var loading1 = 'Submit';
  var loading = false;
  
    Future<String> getData() async{
      if (sent == false){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.get(
        Uri.encodeFull('https://giftedhandstutorials.com/api/public/ResetPass/$email'),
        headers: {
          "Accept":"application/json"
        }
      );

      var data = response.body;
      Map<String, dynamic> user = jsonDecode(data);
       print('object');
       var status = user["status"];
       if (status == 200){
         print(user["resetCode"]);
         showToast("Email Successfully Sent");
          setState(() {
          loading1 ='Input Code';
          sent = true;
          codereceived = user["resetCode"];
          });
        // Navigator.push(
        // context,
        // MaterialPageRoute(
        // builder: (context) => MainApp(),
        // ));
        
       } else{
        print('invalid ResetPassword details');
        var error = user["error"];
        showToast(error);
       }
      print(status);
      // saveDetails();
      }else{
        String inputtext = _codeController.text;
        String inputpassword = _passwordController.text;
        String inputcpassword = _cpasswordController.text;
        print('nothing like that' + inputtext + codereceived + inputpassword + inputcpassword + email);
        if (inputtext == codereceived){
            String url = 'https://giftedhandstutorials.com/api/public/ChangePassword';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email":"$email", "newPass": "$inputpassword", "c_pass": "$inputcpassword"}';
  print(json);
  // make POST request
   Response response = await put(url, headers: headers, body: json);
     int statusCode = response.statusCode;
  // // this API passes back the id of the new item added to the body
   String body = response.body;
   Map<String, dynamic> user = jsonDecode(body);
   var status = user["status"];
   if(status==200){
     print('yeah');
      showToast('Successfully changed'); 
          setState(() {
          loading1 ='ResetPassword';
          sent = false;
          });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Login(),
  ));
   } else{
     var error = user["error"];
     showToast(error); 
   }
        } // if inputtext == codereceived
        else{
          // if inputtext != codereceived
          showToast('invalid code'); 
          setState(() {
          loading1 ='ResetPassword';
          sent = false;
          });          
        }

          // setState(() {
          // loading1 ='ResetPassword';
          // sent = false;
          // });
      }     
    }
    
  @override
  Widget build(BuildContext context) {

    
    return new Scaffold(
        appBar: AppBar(
          title: Text('Reset Password', textAlign: TextAlign.left,),
          backgroundColor: Color.fromRGBO(197, 37, 107, 1.0),
          elevation: 0.0,
          iconTheme: new IconThemeData(
            color: Color.fromRGBO(197, 37, 107, 1.0),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: 
                  sent ? Text('Input Activation Code'): Text('Input Your Email'),
                  // Text(
                  //   "Input Your Email",
                  //   style: TextStyle(),
                  // ),
                ),
                SizedBox(height: 40),

                // this place will check if the code has been sent to know what to display
                sent ? 
                new TextFormField(
                  // keyboardType: TextInputType.emailAddress,
                  controller: _codeController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Activation Code",
                      prefixIcon: Icon(Icons.confirmation_number,
                          color: Color.fromRGBO(197, 37, 107, 1.0)),
                      labelStyle: TextStyle(fontSize: 15)),
                ): 
                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromRGBO(197, 37, 107, 1.0)),
                      labelStyle: TextStyle(fontSize: 15)),
                ), SizedBox(height:10),
                sent ? 
                new TextFormField(
                  // keyboardType: TextInputType.emailAddress,
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline,
                          color: Color.fromRGBO(197, 37, 107, 1.0)),
                      labelStyle: TextStyle(fontSize: 15)),
                ): 
                new SizedBox(height:10),
                new SizedBox(height:10),
                sent ? 
                new TextFormField(
                  // keyboardType: TextInputType.emailAddress,
                  controller: _cpasswordController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromRGBO(197, 37, 107, 1.0)),
                      labelStyle: TextStyle(fontSize: 15)),
                ): 
                new SizedBox(height:10),


                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    print('started');
                    print(loading1);
                    setState(() {
                      loading1 ='LOADING...';
                    });
                    email = _emailController.text;
                    print(loading1);
                    print(_emailController.text);
                    getData();
                  },
                  child: Text(loading1,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  color: Color.fromRGBO(197, 37, 107, 1.0),
                  elevation: 0,
                  minWidth: 400,
                  height: 50,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                SizedBox(height: 40),
                Center(
                    child: RichText(
                  text: new TextSpan(children: [
                    TextSpan(
                        text: "Activation code will be sent to this email",
                        style: TextStyle(color: Colors.black, fontSize: 15)),

                  ]),
                ))
              ],
            ),
          ),
        ));
  }
}
