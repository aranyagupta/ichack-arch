import 'package:flutter/material.dart';
import 'package:hack_app/main.dart';

void main() => runApp(const HistoryPage());

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  static const String _title = 'Journey History';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.teal,),
        drawer: MyDrawer(),
        body: Column(
            children: const [NetTimeText(), NetTimeValue(), JourneyTable()]),
      ),
    );
  }
}

class NetTimeText extends StatelessWidget {
  const NetTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Total Time Gained/Lost: ',
        style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
      )
    );
  }
}

class NetTimeValue extends StatelessWidget {
  const NetTimeValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '+33 secs',
      style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 4.0),
    );
  }
}

class JourneyTable extends StatelessWidget {
  const JourneyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Time Started',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Duration',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Time Gained',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Time Lost',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Net Time',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('01.01.2023 at 13:49')),
            DataCell(Text('24 mins')),
            DataCell(Text('8 secs')),
            DataCell(Text('3 secs')),
            DataCell(Text('+5 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('02.01.2023 at 14:29')),
            DataCell(Text('67 mins')),
            DataCell(Text('48 secs')),
            DataCell(Text('2 secs')),
            DataCell(Text('+46 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('01.01.2023 at 17:12')),
            DataCell(Text('37 mins')),
            DataCell(Text('5 secs')),
            DataCell(Text('6 secs')),
            DataCell(Text('-5 secs', style: TextStyle(color: Colors.red)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('31.12.2022 at 16:46')),
            DataCell(Text('74 mins')),
            DataCell(Text('24 secs')),
            DataCell(Text('6 secs')),
            DataCell(Text('-18 secs', style: TextStyle(color: Colors.red)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('30.12.2022 at 03:36')),
            DataCell(Text('2 mins')),
            DataCell(Text('7 secs')),
            DataCell(Text('5 secs')),
            DataCell(Text('2 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('29.12.2022 at 22:53')),
            DataCell(Text('59 mins')),
            DataCell(Text('25 secs')),
            DataCell(Text('48 secs')),
            DataCell(Text('-13 secs', style: TextStyle(color: Colors.red)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('28.12.2022 at 15:29')),
            DataCell(Text('14 mins')),
            DataCell(Text('24 secs')),
            DataCell(Text('11 secs')),
            DataCell(Text('13 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('27.12.2022 at 19:29')),
            DataCell(Text('26 mins')),
            DataCell(Text('14 secs')),
            DataCell(Text('4 secs')),
            DataCell(Text('10 secs', style: TextStyle(color: Colors.green)))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('26.12.2022 at 05:16')),
            DataCell(Text('92 mins')),
            DataCell(Text('64 secs')),
            DataCell(Text('71 secs')),
            DataCell(Text('-7 secs', style: TextStyle(color: Colors.red)))
          ],
        ),
      ],
    );
  }
}
