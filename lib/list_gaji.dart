import 'dart:convert';

import 'package:aplikasi_penggajian/detail_gaji.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bottom_bar.dart';

class ListGaji extends StatefulWidget {
  String username = "";
  String id;
  ListGaji({this.username}); //this.id
  @override
  _ListGajiState createState() => _ListGajiState();
}

class _ListGajiState extends State<ListGaji> {
  Future<List> getGaji() async {
    final response = await http.post("http://10.0.2.2:7200/gaji", body: {
      "username": widget.username,
    });
    return json.decode(response.body);

    // p
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Gaji"),
      ),
      body: new FutureBuilder<List>(
        future: getGaji(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 6),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new DetailGaji(
                  list: list,
                  index: i,
                ),
              ),
            ),
            child: Card(
              elevation: 2,
              child: ListTile(
                title: Text(
                  list[i]['bulan'],
                  style: TextStyle(fontSize: 16),
                ),
                leading: new Icon(
                  Icons.attach_money,
                  color: Colors.blue,
                  size: 36,
                ),
                subtitle:
                    new Text("Gaji Bersih : Rp.${list[i]['gaji_bersih']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
