// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hack_app/friends.dart';
import 'package:hack_app/history_page.dart';
import 'package:hack_app/profile_page.dart';
import 'package:hack_app/terra.dart';

void main() => runApp(MyApp());

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
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
              title: Text("Friends"),
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
              title: Text("Journey History"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            );
          })),
        ]),
      ),
    );
  }
}

class LifePlot extends StatefulWidget {
  @override
  _LifePlot createState() => _LifePlot();
}

class _LifePlot extends State<LifePlot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.transparent),
      margin: EdgeInsets.all(10),
      child: SizedBox(
        child: Column(children: [
          Text("Net change in lifespan today:"),
          Text(
            "30s",
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Image.asset("assets/images/line-graph.png"),
          )
        ]),
        height: 300,
        width: 400,
      ),
    );
  }
}

class Leaderboard extends StatefulWidget {
  @override
  State<Leaderboard> createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 200,
          width: 300,
          child: Text("Leaderboard"),
        ));
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool journey_started = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            child:
                journey_started ? Text("Stop journey") : Text("Start journey"),
            onPressed: () {
              setState(() {
                journey_started = false;
              });
            }));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              'Lifer',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        },
                      );
                    },
                  ))
            ]),
        drawer: MyDrawer(),
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Builder(builder: (context) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      openBrowserTab();
                    },
                    child: Text("Connect to Terra"));
              }),
              SizedBox(
                height: 10,
              ),
              Start(),
              SizedBox(height: 10),
              LifePlot(),
              Leaderboard()
            ])),
      ),
    );
  }
}
