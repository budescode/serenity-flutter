import 'dart:convert';
import 'package:Ecomme/screens/bottomnavbar/bottomnavbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'resetpassword.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'register.dart';


//Color.fromRGBO(197, 37, 107, 1.0)


class Login extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  void showToast(themsg) {
    Fluttertoast.showToast(
        msg: themsg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String email = '';
  String password = '';
  var loading1 = 'LOGIN';
  var loading = false;

_makePostRequest() async {
  try{
      setState(() {
      loading = true;
      });
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // set up POST request arguments
  String url = 'https://renatech20.pythonanywhere.com/accountapi/login/';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$email", "password": "$password"}';
  print(email);
  print(password);

  // make POST request
   Response response = await post(url, headers: headers, body: json);
  // // check the status code for the result
   int statusCode = response.statusCode;
  // // this API passes back the id of the new item added to the body
   String body = response.body;
   Map<String, dynamic> message = jsonDecode(body);
   if(statusCode >= 400){
     showToast(message["message"]);
   } else{
     prefs.setString('token', message["token"]);
     prefs.setString('fullname', message["fullname"]);
     prefs.setString('email', message["email"]);
     prefs.setString('phone_number', message["phone_number"]);
     showToast('successfully logged in');
    //  print(message);
      Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => BottomNav(),
        ));
   }
     setState(() {
      loading = false;
      });
  } catch(e){
    showToast('error');
    print(e);
  }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
          child: new Scaffold(
          appBar: AppBar(
            title: Text(''),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: new IconThemeData(
              color: Colors.black,
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
                          child: new Text(
                            "Welcome back",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: new Text(
                            "Sign in to continue",
                            style: TextStyle(),
                          ),
                        ),
                        SizedBox(height: 40),
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
                                  color: Colors.black),
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock,
                                  color: Colors.black),
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            RichText(
                              text: new TextSpan(children: [
                                TextSpan(
                                    text: "Forgot Password?",
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ResetPassword(),
                                            ));
                                      },
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        loading ? 
                        Center(child: CircularProgressIndicator(backgroundColor: Colors.black,))
                        : MaterialButton(
                          onPressed: () {
                            password = _passwordController.text;
                            email = _emailController.text;
                            _makePostRequest();
                          },
                          child: Text(loading1,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          color: Colors.black,
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
                                text: "Don't have an account?",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15)),
                            TextSpan(
                                text: " Create Account",
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    print('testinggg');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Register(),
                                        ));
                                  },
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15)),
                          ]),
                        ))
                      ],
                    ),
                  ),
                )),
    );
  }
}
