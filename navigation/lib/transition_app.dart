import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransitionApp extends StatelessWidget {
  const TransitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: GalleryScreen());
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = 5.0;
    return Scaffold(
      appBar: AppBar(title: Text("Gallery")),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PhotoScreen(index)));
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

class PhotoScreen extends StatelessWidget {
  final int index;
  const PhotoScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo')),
      body: Center(
        child: Hero(
          tag: "photo-$index",
          child: Image.network("https://picsum.photos/id/$index/400"),
        ),
      ),
    );
  }
}
