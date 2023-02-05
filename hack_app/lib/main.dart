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
        decoration: BoxDecoration(color: Color.fromARGB(255, 113, 112, 112)),
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
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Life span tracker'),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.person,
                      size: 26.0,
                    ),
                  ))
            ]),
        drawer: MyDrawer(),
        body: Center(
            child: Column(children: [
          ElevatedButton(onPressed: () {}, child: Text("Start journey"))
        ])),
      ),
    );
  }
}
