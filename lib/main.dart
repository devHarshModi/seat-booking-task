import 'package:flutter/material.dart';
import 'package:interview/inside_layout.dart';

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
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              child: GridView.extent(
                primary: false,
                maxCrossAxisExtent: width / 2,
                children: <Widget>[
                  chairs(),
                  chairs(),
                  chairs(),
                  chairs(),
                  chairs(),

                  //If we want to add more boxes we can add container in it.
                ],
              )),
        ));
  }
}

class chairs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: inside_layout(),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
        ),
      ),
    );
  }
}
