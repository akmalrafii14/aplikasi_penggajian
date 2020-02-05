import 'dart:convert';

import 'package:aplikasi_penggajian/login_page.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_penggajian/main.dart';
import 'package:http/http.dart' as http;
import 'bottom_bar.dart';

class UserProfile extends StatefulWidget {
  String username = "";
  String id;
  UserProfile({this.username}); //this.id
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<List> getData() async {
    final response = await http.post("http://10.0.2.2:7200/profil", body: {
      "username": widget.username,
    });

    return json.decode(response.body);

    // print(response.body);
    // var datauser = json.decode(response.body);

    // if (datauser.length == 0) {
    // } else {}
    // return datauser;
  }

  BottomBar mBottomBar = BottomBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ProfileList(list: snapshot.data)
              : new Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  final List list;
  ProfileList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(12),
          // height: double.infinity,
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(list[i]['nama'],
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle:
                          Text("Kode Jabatan : ${list[i]['kode_jabatan']}"),
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue[500],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Setting',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text('Coming Soon! :D'),
                      leading: Icon(
                        Icons.settings,
                        color: Colors.blue[500],
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new LoginPage(),
                        ),
                      ),
                      child: ListTile(
                        title: Text('Logout',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text('Back to Login Page'),
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.blue[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
