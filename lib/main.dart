import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.red, accentColor: Colors.blueAccent),
      home: new MyHomePage(title: 'Wodzilla'),
      routes: {
        "test": (BuildContext ctx) {
          return Scaffold(body: Center(child: Text("Test page")));
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final _items = [
    {"icon": Icons.watch, "value": "Stop watch"},
    {"icon": Icons.watch_later, "value": "Timer"},
    {"icon": Icons.plus_one, "value": "Counter"},
    {"icon": Icons.fitness_center, "value": "Exercises"},
    {"icon": Icons.import_contacts, "value": "Archive"},
    {"icon": Icons.edit, "value": "New workout"},
  ];

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new GridView.count(
            crossAxisCount: 2,
            children: widget._items.map((item) {
              return new Column(
                key: Key(item['value']),
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(item["icon"]),
                    color: Theme.of(context).accentColor,
                    iconSize: 85.0,
                    tooltip: item['value'],
                    onPressed: () {
                      Navigator.of(context).pushNamed("test");
                    },
                  ),
                  Text(
                    item['value'],
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }).toList()));
  }
}
