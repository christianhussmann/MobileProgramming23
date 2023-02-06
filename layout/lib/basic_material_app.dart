import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicMaterialApp extends StatelessWidget {
  const BasicMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.green ,
      // ),
      // themeMode: ThemeMode.light,
      // theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello world'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ],
        ),
        body: Center(
          child: Text('Body'),
        ),
      ),
    );
  }
}
