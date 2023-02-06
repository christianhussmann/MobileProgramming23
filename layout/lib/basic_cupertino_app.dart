import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicCupertinoApp extends StatelessWidget {
  const BasicCupertinoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Hello world",
      // theme: CupertinoThemeData(brightness: Brightness.dark),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Center(child: Text("Hello World")),
          trailing: Row(
            children: [
              CupertinoButton(onPressed: () {}, child: Icon(Icons.menu)),
              CupertinoButton(onPressed: () {}, child: Icon(Icons.favorite))
            ],
          ),
        ),
        child: Center(child: Text('Body')),
      ),
    );
  }
}
