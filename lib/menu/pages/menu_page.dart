import 'package:app_encuestas/conteo/page/conteo.dart';
import 'package:app_encuestas/conteo/page/menuConteo.dart';
import 'package:app_encuestas/encuesta/pages/encuesta_page.dart';
import 'package:app_encuestas/encuesta/pages/menuEncuesta.dart';
import 'package:app_encuestas/menu/services/serviceMenu.dart';
import 'package:app_encuestas/menu/showdialogs/deseaSalirApp.dart';
import 'package:app_encuestas/murales/pages/murales_menu.dart';
import 'package:app_encuestas/semaforo/semaforoSimpatizantes.dart';
import 'package:app_encuestas/share/showdialog/guardadoexito.dart';
import 'package:app_encuestas/simpatizantes/pages/simpatizantesMenu.dart';
import 'package:app_encuestas/simpatizantes/share/guardadoexito.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  servicemenu gtxmenu=Get.put(servicemenu());
  semaforosimpatizantesService gtxsemaforo=Get.put(semaforosimpatizantesService());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async {
        deseaSalirdeLaapp(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: 
        Obx(()=> gtxmenu.esperar.value==false?
        Stack(
        
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
            Center(
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //encuesta
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                      //   child: InkWell(
                      //     borderRadius: BorderRadius.circular(10),
                      //     onTap: () async{
                      //       gtxmenu.esperar.value=true;
                      //        var r = await gtxencuestaService.getNumberEncuestas();
                      //       await gtxencuestaService.getNumberEncuestasAPI();
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (_) => const menuEncuesta()));
                      //               gtxmenu.esperar.value=false;
                      //     },
                      //     child: _card(
                      //         const Color(0xFFFF5F6D),
                      //         const Color(0xFFFFC371),
                      //         Color.fromARGB(111, 0, 0, 0),
                      //         "Encuesta",
                      //         "assets/images/menu/encuestas.png"),
                      //   ),
                      // ),
                      // // //Simpatizante
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                      //   child: InkWell(
                      //     borderRadius: BorderRadius.circular(10),
                      //     onTap: () async{
                      //           gtxmenu.esperar.value=true;
                      //       await gtxsemaforo.getEncuestasNumberNumber();
                      //      await  gtxsimpatizantes.getNumberEncuestas();
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (_) => const menuSimpatizantesPage()));
                      //                   gtxmenu.esperar.value=false;
                      //     },
                      //     child: _card(
                      //         const Color(0xFFFF5F6D),
                      //         const Color(0xFFFFC371),
                      //         Color.fromARGB(111, 5, 5, 5),
                      //         "Simpatizantes",
                      //         "assets/images/menu/encuestas.png"),
                      //   ),
                      // ),
                      //murales
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                      //   child: InkWell(
                      //     borderRadius: BorderRadius.circular(10),
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (_) => const MuralesPage()));
                      //     },
                      //     child: _card(
                      //         const Color(0xFFFF5F6D),
                      //         const Color(0xFFFFC371),
                      //         Color.fromARGB(111, 0, 0, 0),
                      //         "Murales",
                      //         "assets/images/menu/encuestas.png"),
                      //   ),
                      // ),
                      //Propuestas
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                      //   child: InkWell(
                      //     borderRadius: BorderRadius.circular(10),
                      //     onTap: () async{
                          
                      // await  _launchUrl();
                           
                      //     },
                      //     child: _card(
                      //         const Color(0xFFFF5F6D),
                      //         const Color(0xFFFFC371),
                      //         Color.fromARGB(111, 0, 0, 0),
                      //         "Propuestas",
                      //         "assets/images/menu/encuestas.png"),
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                          //  SystemNavigator.pop();
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const menuConteoPage()));
                          },
                          child: _card(
                              const Color(0xFFFF5F6D),
                              const Color(0xFFFFC371),
                              Color.fromARGB(111, 0, 0, 0),
                              "Registro Electoral",
                              "assets/images/menu/encuestas.png"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                           SystemNavigator.pop();
                          },
                          child: _card(
                              const Color(0xFFFF5F6D),
                              const Color(0xFFFFC371),
                              Color.fromARGB(111, 0, 0, 0),
                              "Salir",
                              "assets/images/menu/encuestas.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ):Container(child: Center(child: CircularProgressIndicator(),)),),
        
      ),
    );
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
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: CustomPaint(
              size: const Size(100, 150),
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
                        style: const TextStyle(
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
        const Offset(0, 0), Offset(size.width, size.height), [
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
Future<void> _launchUrl() async {
   final Uri _url = Uri.parse('https://drive.google.com/drive/folders/1RBoQZ0GVi1PFwGxVJHZ1Yz5adVp2virB');
  if (!await launchUrl(_url)) {
    throw 'error en la direccion $_url';
  }
}