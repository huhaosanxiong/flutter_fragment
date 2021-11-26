import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({required this.title});

  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,

      // padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: () {
              print('tapped');
            },
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Counter(),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        ElevatedButton(
          child: Text('Count++'),
          onPressed: () {
            _increment();
          },
        ),
        Spacer(),
        Text('Count:$_counter'),
        Spacer(),
      ],
    );
  }
}

void main(List<String> args) {
  runApp(MaterialApp(
    title: 'My App',
    home: MyScaffold(),
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}
