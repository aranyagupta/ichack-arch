import 'package:flutter/material.dart';

void main() => runApp(const HistoryPage());

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  static const String _title = 'My History';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Column(children: const [NetTimeText(), NetTimeValue(), JourneyTable()]),
      ),
    );
  }
}

class NetTimeText extends StatelessWidget {
  const NetTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total Time Gained: ',
      style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0),
    );
  }
}

class NetTimeValue extends StatelessWidget {
  const NetTimeValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '34 secs',
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
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Duration',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Time Gained/Lost',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('01.01.2023 at 13:49')),
            DataCell(Text('24 minutes')),
            DataCell(Text('8 seconds')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('02.01.2023 at 14:29')),
            DataCell(Text('67 minutes')),
            DataCell(Text('48 seconds')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('03.01.2023 at 17:12')),
            DataCell(Text('4 minutes')),
            DataCell(Text('1 seconds')),
          ],
        ),
      ],
    );
  }
}
