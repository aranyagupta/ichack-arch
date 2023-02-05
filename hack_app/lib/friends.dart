import 'package:flutter/material.dart';
<<<<<<< HEAD
import './data_friends.dart';
=======
import 'package:hack_app/main.dart';
>>>>>>> 48ed8743391912c00d9f4c0aed04d464c5c67b23

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});


  @override
  Widget build(BuildContext context) {
    const title = 'My Friends';

    // map a list of friends into a list of widgets
    final List<Widget> friendListWidget = List.generate(
      friendList.length,
        (i) => ListTile(
          // ignore: prefer_const_constructors
          leading: Icon(Icons.person),
          title: Text(
            friendList[i],
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontFamily: "Raleway"
            ),
          ),
          // subtitle:
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.more_horiz)
            ],
          )
      )
    );

    return MaterialApp(
      // TO DO: search bar to add friends
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        drawer: MyDrawer(),
        body: ListView(children: friendListWidget),
      ),
    );
  }
}
