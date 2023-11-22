import 'package:flutter/material.dart';
import 'dart:ui' as ui;
Widget cardDecoration(Color startColor, Color endColor, Color _colorShadow,
    String _title, _image) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  colors: [startColor, endColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: endColor,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: CustomPaint(
              size: Size(100, 150),
              painter: CustomCardShapePainter(12, startColor, endColor),
            ),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    _image,
                    color: Colors.white,
                    height: 20.0,
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _title,
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 19.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget card(
    List<Color> _colorGradient, Color _colorShadow, String _title, _image) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
    child: Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _colorGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF63AEED).withOpacity(0.2),
                blurRadius: 10.0,
                spreadRadius: 5.1,
                offset: Offset(3, 10))
          ]),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Image.asset(
                _image,
                height: 25.0,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  _title,
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontSize: 19.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
