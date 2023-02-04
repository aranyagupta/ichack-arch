import "package:flutter/material.dart";

class FriendsList extends StatefulWidget {
  // added based on debugger recommendation
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsList();
}

class _FriendsList extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    const title = 'My Friends';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              // leading: Icon(Icons.map),
              title: Text('Friend 1'),
            ),
            ListTile(
              // leading: Icon(Icons.photo_album),
              title: Text('Friend 2'),
            ),
            ListTile(
              // leading: Icon(Icons.phone),
              title: Text('Friend 3'),
            ),
          ],
        ),
      ),
    );
  }
}


