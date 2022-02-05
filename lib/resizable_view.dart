import 'package:flutter/material.dart';
import 'package:interview/manipulating_ball.dart';

//The resizeable widget is used to manipulate the size of the chair and the box assigned to a particular seat.
class ResizableWidget extends StatefulWidget {
  const ResizableWidget({required this.child});

  final Widget child;

  @override
  _ResizableWidgetState createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  double ballDiameter = 20.0;
  double balldiameter = 10.0;
  double height = 140;
  double width = 140;

//Only the top and the ;eft side are only taken into consideration and then as per the need the other points are manipulated taking the height into consideration.
  double top = 0;
  double left = 0;

//Mainly dy(y-axis) and dx(x-axis) are taken in to the case so that they can change the position of the image as per the difference i the movement of the points.
  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Stack is used to position each and every Gesture Detector aspects thus forming a complete combination of 4 points which can be used to change the size of the screen
    return Stack(
      children: <Widget>[
        //Each and every position of the gesture points is calculated mathematically using various fucntions.
        Positioned(
          top: top,
          left: left,
          child: Container(
            height: height,
            width: width,
            color: Colors.transparent,
            child: widget.child,
          ),
        ),
        // top middle
        Positioned(
          top: top - balldiameter,
          left: left + width / 2 - balldiameter,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = height - dy;
              setState(() {
                height = (newHeight > 20 && newHeight < 200) ? newHeight : 200;
                top = top + dy;
              });
            },
          ),
        ),

        // bottom center
        Positioned(
          top: top + height - balldiameter,
          left: left + width / 2 - balldiameter,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = height + dy;
              setState(() {
                height = (newHeight > 20 && newHeight < 200) ? newHeight : 200;
              });
            },
          ),
        ),
        // center right
        Positioned(
          top: top + height / 2 - balldiameter,
          left: left + width - balldiameter,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newWidth = width + dx;

              setState(() {
                width = (newWidth > 20 && newWidth < 200) ? newWidth : 200;
              });
            },
          ),
        ),
        //left center
        Positioned(
          top: top + height / 2 - balldiameter,
          left: left - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newWidth = width - dx;

              setState(() {
                width = (newWidth > 20 && newWidth < 200) ? newWidth : 200;
                left = (left + dx);
              });
            },
          ),
        ),
      ],
    );
  }
}