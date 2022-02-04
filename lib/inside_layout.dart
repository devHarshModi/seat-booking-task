import 'package:flutter/material.dart';

class inside_layout extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<inside_layout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ResizebleWidget(
        child: Center(
            child: Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                //The image is imported using the assets in pubspec.yaml and can be even taken from the network directly.
                child: Image.asset('images/img.png'))),
      ),
    );
  }
}

//The resizeable widget is used to manipulate the size of the chair and the box assigned to a particular seat.
class ResizebleWidget extends StatefulWidget {
  const ResizebleWidget({required this.child});

  final Widget child;

  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();
}

// The radius of the gesture Detector.
const ballDiameter = 20.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double balldiameter= ballDiameter/2;
  double height = 150;
  double width = 150;

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

class ManipulatingBall extends StatefulWidget {
  const ManipulatingBall({Key? key, required this.onDrag});

  final Function onDrag;

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  late double initX;
  late double initY;

//The drag is for the point that can be dragged and then the change in position of the seat is calculated as shown.
  //But the initial X and Y axis are always considered.
  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    //The Gesture Detector are the main points that help in controlling the different situations of the Black Dots.
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
