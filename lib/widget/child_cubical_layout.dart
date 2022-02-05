import 'package:flutter/material.dart';
import 'package:interview/chair_layout.dart';

class ChildCubicalLayout extends StatelessWidget {

  const ChildCubicalLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: const ChairLayout(),
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