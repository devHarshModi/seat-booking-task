import 'package:flutter/material.dart';
import 'package:interview/widget/widget.dart';

void main() => runApp(const MyApp());

//The black dots are for resizing the size of the chair as well as the are around the chair.
//The seat can be adjusted as per the need and even the size of chair can be manipulated as per requirement.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CubicalLayoutScreen(),
    );
  }
}

class CubicalLayoutScreen extends StatefulWidget {
  const CubicalLayoutScreen({Key? key}) : super(key: key);

  @override
  _CubicalLayoutScreenState createState() => _CubicalLayoutScreenState();
}

class _CubicalLayoutScreenState extends State<CubicalLayoutScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Seat Booking"),
          backgroundColor: Colors.black,
        ),
        //The body is assigned with the GridView.
        //Container as per the requirements are taken.
        //maxCrossAxisExtent as per given assigns only 2 boxes in a row and thus forming grid layout with 5 container.
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: GridView.count(
              childAspectRatio: 1,
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: List.generate(5, (index) {
                return const ChildCubicalLayout();
              })
            ),
          )
        )
    );
  }
}

