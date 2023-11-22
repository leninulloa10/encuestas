import 'package:app_encuestas/alcaldiadiciembre/services/encuestasService.dart';
import 'package:app_encuestas/alcaldiadiciembre/menu.dart';
import 'package:app_encuestas/alcaldiadiciembre/models/bdDiciembre.dart';
import 'package:app_encuestas/encuesta/pages/exitoguardado2.dart';
import 'package:app_encuestas/encuesta/pages/menuEncuesta.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// encuestaService gtxencuestaService = Get.put(encuestaService());
void guardadoExitoSQLLITE(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Guardado con éxito',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () async {
                      _dismissDialog(context);
                      // var r = await gtxencuestaService.getNumberEncuestas();
                      encuestasServiceDiciembre gtxencuestaService =
                          Get.put(encuestasServiceDiciembre());
                      gtxencuestaService.arraysql.clear();
                      gtxencuestaService.arraysql
                          .add(await BDDiciembre.getTodo());
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              menuPrincipalDiciembre(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text('Aceptar')),
              ],
            )
          ],
        );
      });
}

Future<dynamic> sincronizadoExito(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Sincronizado con éxito',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () async {
                      _dismissDialog(context);
                      // var r = await gtxencuestaService.getNumberEncuestas();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              menuPrincipalDiciembre(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text('Aceptar')),
              ],
            )
          ],
        );
      });
}

void sincronizadoError(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Error al Sincronizar',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () async {
                      _dismissDialog(context);
                      // var r = await gtxencuestaService.getNumberEncuestas();

                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         const menuConteoPage(),
                      //   ),
                      //   (route) => false,
                      // );
                    },
                    child: const Text('Aceptar')),
              ],
            )
          ],
        );
      });
}

void errorGuardadoSQLLITE(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Error al Guardar',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () async {
                      _dismissDialog(context);
                      // var r = await gtxencuestaService.getNumberEncuestas();

                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const menuConteoPage(),
                      //   ),
                      //   (route) => false,
                      // );
                    },
                    child: const Text('Aceptar')),
              ],
            )
          ],
        );
      });
}

_dismissDialog(context) {
  Navigator.pop(context);
}
