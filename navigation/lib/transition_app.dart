import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransitionApp extends StatelessWidget {
  const TransitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:
          Scaffold(appBar: AppBar(title: Text("Gallery")), body: GridScreen()),
    );
  }
}

class GridScreen extends StatelessWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = 5.0;
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.all(spacing),
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        crossAxisCount: 3,
        physics: BouncingScrollPhysics(),
        children: List.generate(
          50,
          (index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(index)));
            },
            child: Hero(
              tag: "photo-$index",
              child: Image.network("https://picsum.photos/id/$index/200"),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final int index;
  const DetailsScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "photo-$index",
          child: Image.network("https://picsum.photos/id/$index/200"),
        ),
      ),
    );
  }
}
