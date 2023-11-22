import 'package:app_encuestas/conteo/models/BD.dart';
import 'package:app_encuestas/conteo/page/conteo.dart';
import 'package:app_encuestas/conteo/page/porSincronizar.dart';
import 'package:app_encuestas/conteo/services/conteoservice.dart';
import 'package:app_encuestas/encuesta/pages/exitoguardado2.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

import '../../menu/pages/menu_page.dart';

class menuConteoPage extends StatefulWidget {
  const menuConteoPage({super.key});

  @override
  State<menuConteoPage> createState() => _menuConteoPageState();
}

class _menuConteoPageState extends State<menuConteoPage> {
  conteoServices gtxconteoService= Get.put(conteoServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Sincronizar
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => conteoVotacionesPage()));
              },
              child: _card(
                  Color(0xFFFF5F6D),
                  Color(0xFFFFC371),
                  Color.fromARGB(255, 7, 7, 7),
                  "Registrar",
                  "assets/images/menu/encuestas.png"),
            ),
            SizedBox(height: 20),
            //Sincronizar
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                gtxconteoService.arrayqslite.clear();
              gtxconteoService.arrayqslite.add(await BD.getTodo());
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => porSincronizarPage()));
              },
              child: _card(
                  Color(0xFFFF5F6D),
                  Color(0xFFFFC371),
                  Color.fromARGB(255, 7, 7, 7),
                  "Lista Pendiente",
                  "assets/images/menu/encuestas.png"),
            ),
                 SizedBox(height: 20),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const MenuPage(),
                                ),
                              );
                            },
                            child: _card(
                                Color(0xFFFF5F6D),
                                Color(0xFFFFC371),
                                Color.fromARGB(255, 7, 7, 7),
                                "Menu Principal",
                                "assets/images/menu/encuestas.png"),
                          ),
          ],
        ),
      )),
    );
  }
}

Widget _card(Color startColor, Color endColor, Color _colorShadow,
    String _title, _image) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  colors: [startColor, endColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: _colorShadow,
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
              mainAxisAlignment: MainAxisAlignment.start,
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
