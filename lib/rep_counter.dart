import 'package:flutter/material.dart';

class RepCounter extends StatefulWidget {
  @override
  _RepCounterState createState() => _RepCounterState();
}

class _RepCounterState extends State<RepCounter> {
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

        // child: Stack(
        //   children: <Widget>[
        //     Center(
        //       child: Padding(
        //         padding: EdgeInsets.all(32.0),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             border: Border.all(width: 8.0, color: Colors.white),
        //             shape: BoxShape.circle,
        //             color: Colors.tealAccent.shade700,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Center(
        //       child: Text(
        //         "18",
        //         style: TextStyle(
        //             fontSize: 95.0,
        //             color: Colors.indigo.shade700,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
