import 'package:app_encuestas/encuesta/pages/menuEncuesta.dart';
import 'package:app_encuestas/encuesta/services/encuestaService.dart';
import 'package:app_encuestas/murales/pages/murales_menu.dart';
import 'package:app_encuestas/murales/services/muralesServices.dart';
import 'package:app_encuestas/simpatizantes/pages/simpatizantesMenu.dart';
import 'package:app_encuestas/simpatizantes/services/simps_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


muralesServices gtxmurales=Get.put(muralesServices());

void guardadoExxitosmurales(context) {
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
                      var r = await gtxmurales.getNumberEncuestas();
                       await gtxmurales.reset();
                      // questionSeervice gtxQS = Get.put(questionSeervice());
                      // print("*************guardado een local storage*****");
                      // await gtxQS.GuardarOffline();
                      // print("*************recuperar*****");

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MuralesPage(),
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

_dismissDialog(context) {
  Navigator.pop(context);
}
