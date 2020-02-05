import 'dart:core';

import 'package:aplikasi_penggajian/bottom_bar.dart';
import 'package:aplikasi_penggajian/profile.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ));

class MainPage extends StatefulWidget {
  String username;
  String id;
  MainPage({this.username});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Profile"),
        ),
        body: Center(child: Text("AAA")),
        bottomNavigationBar: BottomBar(
          username: widget.username,
        ),
      ),
    );
  }
}
