import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  void reset() {
    setState(() {
      _count = 0;
    });
  }

  void inc() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rep counter")),
      body: Center(
        child: GestureDetector(
          onLongPress: reset,
          child: RawMaterialButton(
            onPressed: inc,
            shape: CircleBorder(),
            elevation: 4.0,
            fillColor: Theme.of(context).accentColor,
            // padding: EdgeInsets.all(64.0),
            constraints: BoxConstraints(minHeight: 250.0, minWidth: 250.0),
            child: Text(
              _count.toString(),
              style: TextStyle(
                fontSize: 90.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
