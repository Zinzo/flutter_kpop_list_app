import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          width:  50,
          child: CircularProgressIndicator(),
        ),
        Expanded(
          child: Container()
        )
      ],
    );
  }
}