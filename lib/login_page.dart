import 'package:aplikasi_penggajian/bottom_bar.dart';
import 'package:aplikasi_penggajian/profile.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:aplikasi_penggajian/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String username;
String id;

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String message = "";

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Whoops!"),
          content: new Text("Credentials does not match with our records!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Try Again"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<List> _login() async {
    final response = await http.post("http://10.0.2.2:7200/login", body: {
      "username": user.text,
      "password": pass.text,
    });

    print(response.body);
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      _showDialog();
    } else {
      // var getId = datauser[id];
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(
            username: user.text,
            // id: getId.toString(),
          ),
        ),
      );
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                "Ini Aplikasi Penggajian",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Username"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: "Password"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: ButtonTheme(
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    _login();
                  },
                  child: Text("Sign in"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
