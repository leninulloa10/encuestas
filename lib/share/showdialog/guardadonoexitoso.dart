
import 'package:flutter/material.dart';

void guardadoNOExito(context) {
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
                const Text(
                  'Error al Guardado',
                  maxLines: 22,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () async {
                      _dismissDialog(context);

                      //questionSeervice gtxQS = Get.put(questionSeervice());
                      // gtxQS.resetquestions();
                     
                   
                      // Navigator.pushAndRemoveUntil(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return mainview();
                      // }), (route) => false);
                    
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
