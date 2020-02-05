import 'package:aplikasi_penggajian/list_gaji.dart';
import 'package:aplikasi_penggajian/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  String username;
  // String id;
  BottomBar({this.username}); //this.id
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int bottomSelectedIndex = 0;
  // final controller = PageController();
  // final tabs = [
  //   ListGaji(),
  //   UserProfile(),
  // ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: [
        ListGaji(
          username: widget.username,
        ),
        UserProfile(
          username: widget.username,
        ),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavigationBar(),
      ),
    );
  }

  List<BottomNavigationBarItem> buildBottomNavigationBar() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
        backgroundColor: Colors.red,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
        backgroundColor: Colors.blueGrey,
      ),
    ];
  }
}
