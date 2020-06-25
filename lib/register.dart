import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifted Hands',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'product-sans'),
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void showToast(themsg) {
    Fluttertoast.showToast(
        msg: themsg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  String fullname = '';
  String phone = '';
  String email = '';
  String password = '';
  String cpassword = '';
  bool loading = false;
_makePostRequest() async {
  try{
      setState(() {
      loading = true;
      });
  // set up POST request arguments
  String url = 'https://renatech20.pythonanywhere.com/accountapi/usercreate/';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$email", "fullname": "$fullname", "password": "$password", "phone_number":"$phone"}';
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
     showToast('successfully registered');
      Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => Login(),
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
    return new Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(
            color: Color.fromRGBO(197, 37, 107, 1.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: new Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(197, 37, 107, 1.0),
                  ),
                ),
              ),
              Center(
                child: new Text(
                  "Create a new account",
                  style: TextStyle(),
                ),
              ),
              SizedBox(height: 20),
              new TextFormField(
                controller: _fullnameController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person_outline,
                        color: Color.fromRGBO(197, 37, 107, 1.0)),
                    labelStyle: TextStyle(fontSize: 15)),
              ),
              SizedBox(height: 10),
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
              ),
              SizedBox(height: 10),
              new TextFormField(
                keyboardType: TextInputType.text,
                controller: _phoneController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone,
                        color: Color.fromRGBO(197, 37, 107, 1.0)),
                    labelStyle: TextStyle(fontSize: 15)),
              ),
              SizedBox(height: 10),
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
                        color: Color.fromRGBO(197, 37, 107, 1.0)),
                    labelStyle: TextStyle(fontSize: 15)),
              ),
              SizedBox(height: 10),
              new TextFormField(
                controller: _confirmpasswordController,
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
              ),
              SizedBox(height: 10),
              loading ? Center(child: CircularProgressIndicator(backgroundColor: Color.fromRGBO(197, 37, 107, 1.0),)):
              MaterialButton(
                onPressed: () {
                   fullname = _fullnameController.text;
                   email = _emailController.text;
                   phone = _phoneController.text;
                   password = _passwordController.text;
                   cpassword = _confirmpasswordController.text;
                   _makePostRequest();
                  },
                child: Text('REGISTER',
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
              SizedBox(height: 10),
              Center(
                  child: RichText(
                text: new TextSpan(children: [
                  TextSpan(
                      text: "Already Registered?",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  TextSpan(
                      text: " Login",
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              )
                              );
                        },
                      style: TextStyle(
                          color: Color.fromRGBO(197, 37, 107, 1.0),
                          fontSize: 15)),
                ]),
              ))
            ],
          ),
        ));
  }
}
