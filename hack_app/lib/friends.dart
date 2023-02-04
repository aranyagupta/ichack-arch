import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Create Widgets of friends on a list of friend names
  // List<Widget> friendToWidget(List<String> friends) {
  //   final List<ListTile> friendsWidget = List.empty();
  //   for(var i = 0; i < friends.length; i++){
  //     friendsWidget.add(
  //       ListTile(title: Text(friends[i])
  //         )
  //       );
  //   }
  //   return friendsWidget;
  // }

  @override
  Widget build(BuildContext context) {
    const title = 'My Friends';

    // a list of friends
    final List<String> friendList = [
      "Advik", "Aranya", "Avighna",
      "Christin", "Hilmi", "Rhea"
    ];

    // map a list of friends into a list of widgets
    final List<Widget> friendListWidget = List.generate(
      friendList.length,
        (i) => ListTile(
          title: Text(friendList[i])
      )
    );

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: friendListWidget
        ),
      ),
    );
  }
}