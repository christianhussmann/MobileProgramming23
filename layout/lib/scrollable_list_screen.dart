import 'package:flutter/material.dart';

class ScrollableListScreen extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            physics: PageScrollPhysics(),
            children: ListTile.divideTiles(
              color: Colors.grey,
              tiles: List.generate(
                20,
                (index) => ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/person$index.jpg")),
                  title: Text("Person $index"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_rounded),
                  ),
                ),
              ),
            ).toList(),
          )),
    );
  }
}
