import 'package:app_encuestas/encuesta/pages/encuesta_page.dart';
import 'package:app_encuestas/encuesta/services/encuestaService.dart';
import 'package:app_encuestas/menu/pages/menu_page.dart';
import 'package:app_encuestas/menu/services/serviceMenu.dart';
import 'package:app_encuestas/share/showdialog/sincronizadoCorrecto.dart';
import 'package:app_encuestas/share/showdialog/sincronizadoFallido.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class menuEncuesta extends StatefulWidget {
  const menuEncuesta({Key? key}) : super(key: key);

  @override
  State<menuEncuesta> createState() => _menuEncuestaState();
}

class _menuEncuestaState extends State<menuEncuesta> {
  servicemenu gtxmenu = Get.put(servicemenu());
  encuestaService gtxencuestaService = Get.put(encuestaService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF97950),
          elevation: 0,
          actions: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child:Obx(()=> Text(
                "Encuestas subidas  "+gtxencuestaService.encuestasSubidasApi.value.toString() ,
                style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
        body: Obx(
          () => gtxmenu.esperar.value == false
              ? Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF97950),
                            Color(0xFFED543C),
                            Color(0xFFE83B2D),
                            Color(0xFFDF191D),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Nuevo simpatizante

                          Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Obx(
                                () => Text(
                                  "Pendientes de Subir:  " +
                                      gtxencuestaService.numeroEncuestasLS.value
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => encuestaPage()));
                            },
                            child: _card(
                                Color(0xFFFF5F6D),
                                Color(0xFFFFC371),
                                Color.fromARGB(255, 1, 1, 1),
                                "Nueva Encuesta",
                                "assets/images/menu/encuestas.png"),
                          ),
                          SizedBox(height: 20),
                          //Sincronizar
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                               gtxmenu.esperar.value =true;
                              var r =
                                  await gtxencuestaService.getLocalStorage();
                              if (r>=200 && r<300) {
                                sincronizadoCorrecto(context);
                              await  gtxencuestaService.getNumberEncuestas();
                               await gtxencuestaService
                                      .getNumberEncuestasAPI();
                                gtxmenu.esperar.value = false;
                              } else {
                                sincronizadoIncorrecto(context);
                                gtxmenu.esperar.value = false;
                              }
                              gtxmenu.esperar.value = false;
                            },
                            child: _card(
                                Color(0xFFFF5F6D),
                                Color(0xFFFFC371),
                                Color.fromARGB(255, 7, 7, 7),
                                "Sincronizar",
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
                    ),
                  ],
                )
              : Container(child: Center(child: CircularProgressIndicator())),
        ));
  }
}

//decoracion

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
