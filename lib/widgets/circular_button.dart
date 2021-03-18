import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircularButton extends StatelessWidget {
  Function fun;
  IconData ic;
  String str;
  CircularButton(this.fun, this.ic, this.str);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: fun,
            elevation: 2.0,
            fillColor: Colors.blue,
            child: Icon(
              ic,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              str,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
