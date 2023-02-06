import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/basic_cupertino_app.dart';
import 'package:layout/cookie_recipe_screen.dart';
import 'package:layout/grid_screen.dart';
import 'package:layout/my_painter.dart';
import 'package:layout/scrollable_list_screen.dart';

import 'basic_material_app.dart';
import 'framed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BasicCupertinoApp();
    // return BasicMaterialApp();
    return MaterialApp(
      // home: FrammedScreen(),
      // home: CookieRecipeScreen(),
      // home: ScrollableListScreen()
      home: GridScreen()
    );
  }
}
