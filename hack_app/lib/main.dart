import 'package:flutter/material.dart';
import 'package:hack_app/friends.dart';
import 'package:hack_app/history_page.dart';

void main() => runApp(MyApp());

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(padding: EdgeInsets.all(20), children: <Widget>[
          Builder(builder: ((context) {
            return ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            );
          })),
          Builder(builder: ((context) {
            return ListTile(
              title: Text("My Friends"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FriendsList()),
                );
              },
            );
          })),
          Builder(builder: ((context) {
            return ListTile(
              title: Text("My History"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            );
          })),
          Builder(builder: ((context) {
            return ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FriendsList()),
                );
              },
            );
          })),
        ]),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Life span tracker')),
        drawer: MyDrawer(),
        body: const Center(
          child: Text(''),
        ),
      ),
    );
  }
}
