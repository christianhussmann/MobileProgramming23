import 'package:flutter/material.dart';

class SizingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _buildExpandedRow(),
        SizedBox(height: 200,),
        _buildFlexibleRow(),
      ]),
    );
  }

  Row _buildFlexibleRow() {
    return Row(
      children: [
        Flexible(child: Container(height: 100, color: Colors.amber)),
        Flexible(child: Container(height: 100, color: Colors.cyan)),
        Flexible(
            flex: 2, child: Container(height: 100, color: Colors.deepPurple)),
      ],
    );
  }

  Row _buildExpandedRow() {
    return Row(
      children: [
        Container(width: 60, height: 100, color: Colors.red),
        Expanded(child: Container(width: 20, height: 100, color: Colors.green)),
        Container(width: 40, height: 100, color: Colors.blue)
      ],
    );
  }
}
