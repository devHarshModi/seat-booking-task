import 'package:flutter/material.dart';
import 'package:interview/resizable_view.dart';

class ChairLayout extends StatefulWidget {
  const ChairLayout({Key? key}) : super(key: key);

  @override
  _ChairLayoutState createState() => _ChairLayoutState();
}

class _ChairLayoutState extends State<ChairLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ResizableWidget(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            //The image is imported using the assets in pubspec.yaml and can be even taken from the network directly.
            child: Image.asset('images/img.png')
          )
        ),
      ),
    );
  }
}
