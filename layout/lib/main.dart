import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/basic_cupertino_app.dart';

import 'basic_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BasicCupertinoApp();
    return BasicMaterialApp();
  }
}
