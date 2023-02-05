// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './data_friends.dart';
import 'package:hack_app/main.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});


  @override
  Widget build(BuildContext context) {
    const title = 'Friends';

    // map a list of friends into a list of widgets
    final List<Widget> friendListWidget = List.generate(
      friendList.length,
        (i) => Card(child: ListTile(
          leading: Icon(Icons.person),
          title: Text(
            friendList[i],
            style: TextStyle(
              fontFamily: "Raleway"
            ),
          ),
          // subtitle:
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(Icons.more_horiz)
            ],
          )
        )
      )
    );

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.teal,
        fontFamily: 'Raleway'
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          backgroundColor: Colors.teal,
        ),
        drawer: MyDrawer(),
        body: Column(
          children: <Widget>[
            const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              hintText: 'Find Friends',
            ),
          ),
        ),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: ListView(children: friendListWidget),
              )
            ),
          ],
        )
      )
    );
  }
}
