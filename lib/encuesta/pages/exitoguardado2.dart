import 'package:app_encuestas/encuesta/pages/menuEncuesta.dart';
import 'package:app_encuestas/encuesta/services/encuestaService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

encuestaService gtxencuestaService = Get.put(encuestaService());
void guardadoExito2(context) {
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
                      var r = await gtxencuestaService.getNumberEncuestas();
                    

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const menuEncuesta(),
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
