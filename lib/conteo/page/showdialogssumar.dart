import 'package:flutter/material.dart';
void mensajeErrorSuma(context) {
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
                    'La suma es mayor a 350',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: ),
               Expanded(child: 
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Revise que las cantidades ingresadas sean correctas',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
               )),
              ],
            ),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () async {
                      _dismissDialog(context);
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
