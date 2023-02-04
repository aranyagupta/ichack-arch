import 'package:flutter/material.dart';
import 'package:hack_app/friends.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Life span tracker')),
        drawer: Drawer(
          backgroundColor: Colors.blue,
          child: ListView(padding: EdgeInsets.all(10), children: <Widget>[
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
                    MaterialPageRoute(builder: (context) => FriendsList()),
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
        body: const Center(
          child: Text(''),
        ),
      ),
    );
  }
}
