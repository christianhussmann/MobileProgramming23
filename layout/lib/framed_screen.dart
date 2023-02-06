
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'my_painter.dart';

class FrammedScreen extends StatelessWidget {
  const FrammedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _MyPaint(),
            Center(
              child: SizedBox(
                width: 300,
                child: ClipOval(child: Image.asset("assets/cookies.jpg")),
              ),
            ),
          ],
        ));
  }
}

class _MyPaint extends StatelessWidget {
  const _MyPaint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: MediaQuery.of(context).size,
    );
  }
}
