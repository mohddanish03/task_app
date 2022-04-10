import 'package:flutter/material.dart';
import 'package:task_app/Screens/nowplaying.dart';
import 'package:task_app/Screens/topRated.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[NowPlaying(), TopRated()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        flexibleSpace: Container(
          color: Colors.pink,
          child: Column(children: <Widget>[
            const SizedBox(height: 38),
            Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintStyle: TextStyle(color: Colors.black38),
                      hintText: "Search"),
                )),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Now Playing",
              icon: Icon(Icons.movie_filter),
            ),
            BottomNavigationBarItem(
              label: "Top Rated",
              icon: Icon(Icons.star_border_outlined),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.blueGrey,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 1),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
