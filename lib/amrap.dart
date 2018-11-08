import 'package:flutter/material.dart';

class Amrap extends StatefulWidget {
  @override
  _AmrapState createState() => _AmrapState();
}

class _AmrapState extends State<Amrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AMRAP")),
      body: Center(
        child: Text("Amrap todo"),
      ),
    );
  }
}
