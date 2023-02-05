import 'package:flutter/material.dart';
import 'package:hack_app/main.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});


  @override
  Widget build(BuildContext context) {
    const title = 'My Friends';

    // a list of friends
    final List<String> friendList = [
      "Advik",
      "Aranya",
      "Avighna",
      "Christin",
      "Hilmi",
      "Rhea"
    ];

    // map a list of friends into a list of widgets
    final List<Widget> friendListWidget = List.generate(
        friendList.length, (i) => ListTile(title: Text(friendList[i])));

    return MaterialApp(
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
