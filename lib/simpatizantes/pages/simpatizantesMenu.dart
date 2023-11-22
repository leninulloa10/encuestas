// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app_encuestas/menu/pages/menu_page.dart';
import 'package:app_encuestas/semaforo/semaforoSimpatizantes.dart';
import 'package:app_encuestas/share/confiSimpatizantes/confiSimpatizantes.dart';
import 'package:app_encuestas/share/showdialog/sincronizadoCorrecto.dart';
import 'package:app_encuestas/share/showdialog/sincronizadoFallido.dart';
import 'package:app_encuestas/simpatizantes/pages/configSimpatizantes.dart';
import 'package:app_encuestas/simpatizantes/pages/nuevo_simp_page.dart';
import 'package:app_encuestas/simpatizantes/share/guardadoexito.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class menuSimpatizantesPage extends StatefulWidget {
  const menuSimpatizantesPage({Key? key}) : super(key: key);

  @override
  State<menuSimpatizantesPage> createState() => _menuSimpatizantesPageState();
}

class _menuSimpatizantesPageState extends State<menuSimpatizantesPage> {
  semaforosimpatizantesService gtxsemaforo =
      Get.put(semaforosimpatizantesService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF97950),
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Objetivo: " + gtxsemaforo.goal.value.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
        body: Obx(
          () => gtxsimpatizantes.esperar.value == false
              ? Stack(children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Obx(() => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Nuevo simpatizante
                              // Text("metaa" + gtxsemaforo.goal.value.toString()),
                              // Text("realizadas" +
                              //     gtxsemaforo.encuestasRealizadas.toString()),
                              if (gtxsemaforo.encuestasRealizadas.value >=
                                  gtxsemaforo.verde.value) ...[
                                //   Text("verdeeeeeeeee"),
                                Container(
                                    width: 50,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    color: Colors.black,
                                    child: Column(children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                        child: Text(""),
                                      ),
                                      Container(
                                        width: 100,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: Text(""),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: Text(""),
                                      ),
                                    ]))
                              ] else ...[
                                if (gtxsemaforo.encuestasRealizadas.value >=
                                        gtxsemaforo.amarillo.value &&
                                    gtxsemaforo.encuestasRealizadas.value <
                                        gtxsemaforo.verde.value) ...[
                                  Container(
                                    width: 50,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle),
                                          child: Text(""),
                                        ),
                                        Container(
                                          width: 100,
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              shape: BoxShape.circle),
                                          child: Text(""),
                                        ),
                                        Container(
                                          width: 100,
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle),
                                          child: Text(""),
                                        )
                                      ],
                                    ),
                                  )
                                ] else ...[
                                  if (gtxsemaforo.encuestasRealizadas.value <
                                      gtxsemaforo.rojo.value) ...[
                                    //  Text("rojo"),
                                    Container(
                                        width: 50,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        color: Colors.black,
                                        child: Column(children: [
                                          Container(
                                            width: 100,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle),
                                            child: Text(""),
                                          ),
                                          Container(
                                            width: 100,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle),
                                            child: Text(""),
                                          ),
                                          Container(
                                            width: 100,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle),
                                            child: Text(""),
                                          )
                                        ]))
                                  ]
                                ]
                              ],

                              Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text("Encuestas sincronizadas",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ),
                                      Container(
                                        child: Obx(
                                          () => Text(
                                            gtxsemaforo.encuestasRealizadas
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                            "Encuestas NO sincronizadas",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ),
                                      Container(
                                        child: Obx(
                                          () => Text(
                                            gtxsimpatizantes
                                                .numeroEncuestas.value
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () async {
                                  // if (gtxsimpatizantes
                                  //         .realizoConfiguracion.value ==
                                  //     false) {
                                  //   errorConfiguracionSimpatizantes(context);
                                  // } else {
                                  await gtxsemaforo.getEncuestasNumberNumber();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              NuevoSimpatizantePage()));
                                  // }
                                },
                                child: _card(
                                    Color(0xFFFF5F6D),
                                    Color(0xFFFFC371),
                                    Color(0xFF15EDED),
                                    "Nuevo simpatizante",
                                    "assets/images/menu/encuestas.png"),
                              ),
                              SizedBox(height: 20),
                              //Sincronizar
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () async {
                                  // if (gtxsimpatizantes
                                  //         .realizoConfiguracion.value ==
                                  //     false) {
                                  //   errorConfiguracionSimpatizantes(context);
                                  // } else {
                                  gtxsimpatizantes.esperar.value = true;

                                  var r =
                                      await gtxsimpatizantes.getLocalStorage();
                                  if (r["status"] == "ok") {
                                    print("guardo simpatizantes");
                                    print(r.toString());
                                    sincronizadoCorrecto(context);
                                    await gtxsimpatizantes.getNumberEncuestas();

                                    await gtxsemaforo
                                        .getEncuestasNumberNumber();
                                    await gtxsimpatizantes.getNumberEncuestas();

                                    gtxsimpatizantes.esperar.value = false;
                                  } else {
                                    sincronizadoIncorrecto(context);
                                    gtxsimpatizantes.esperar.value = false;
                                  }
                                  // }
                                },
                                child: _card(
                                    Color(0xFFFF5F6D),
                                    Color(0xFFFFC371),
                                    Color(0xFF15EDED),
                                    "Sincronizar",
                                    "assets/images/menu/encuestas.png"),
                              ),

                              SizedBox(height: 20),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MenuPage()));
                                },
                                child: _card(
                                    Color(0xFFFF5F6D),
                                    Color(0xFFFFC371),
                                    Color(0xFF15EDED),
                                    "Menu Principal",
                                    "assets/images/menu/encuestas.png"),
                              ),
                            ],
                          )),
                    ),
                  ),
                ])
              : Container(
                  child: Center(
                  child: CircularProgressIndicator(),
                )),
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
