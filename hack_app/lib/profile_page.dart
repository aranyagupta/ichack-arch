// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hack_app/main.dart';
import 'package:hack_app/log_in.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables
class ProfilePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: const Text('My Profile'),
          ),
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.teal
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage('assets/images/stephanie-photo.jpg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stephanie Brown',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.create_rounded),
                    title: Text(
                      'Edit profile information'
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    )
                  )
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings'
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    )
                  )
                ),
                Builder(builder: ((context) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.logout_rounded),
                    title: Text(
                      'Log out'
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    )
                  ),
                );
              })),
              ],
            )
          ],
        ),
      ),
    );
  }
}