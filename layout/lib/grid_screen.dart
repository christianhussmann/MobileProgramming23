import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        children: List.generate(
          20,
          (index) => Card(
            clipBehavior: Clip.antiAlias,
            child: Image.asset("assets/person$index.jpg"),
          ),
        ),
      ),
    );
  }
}
