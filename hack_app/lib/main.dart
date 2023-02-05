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
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: ListView(padding: const EdgeInsets.all(20), children: <Widget>[
          Builder(builder: ((context) {
            return ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
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
              leading: const Icon(Icons.contacts),
              title: const Text("Friends"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FriendsList()),
                );
              },
            );
          })),
          Builder(builder: ((context) {
            return ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Journey History"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
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
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 115, 132, 146)),
      margin: const EdgeInsets.all(10),
      child: const SizedBox(
        height: 170,
        width: 300,
        child: Text("Plot"),
      ),
    );
  }
}

class LeaderboardText extends StatelessWidget {
  const LeaderboardText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Leaderboard',
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
        )
    );
  }
}

class LeaderboardTable extends StatelessWidget {
  const LeaderboardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Rank',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Time Gained/Lost',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Rhea')),
            DataCell(Text('+19023 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('2')),
            DataCell(Text('Christin')),
            DataCell(Text('+4673 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('3')),
            DataCell(Text('Elijah')),
            DataCell(Text('+2946 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  bool journey_started = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              'Lifer',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.person),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => openBrowserTab()),
                      );
                    },
                    child: const Text("Connect to Terra"));
              }),
              const SizedBox(height: 10),
              Container(
                  child: journey_started
                      ? ElevatedButton(
                          onPressed: () {
                          },
                          child: const Text("Stop journey"))
                      : ElevatedButton(
                          child: const Text("Start journey"),
                          onPressed: () {
                          },
                        )),
              LifePlot(),
              Container(child: Text("LEADERBOARD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
              LeaderboardTable()
            ])),
      ),
    );
  }
}
