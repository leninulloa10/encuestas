
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  
void deseaSalirdeLaapp(BuildContext context) {
   showDialog(
   
     
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
                  child:  Text(
                    'Seguro que desea Salir',
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
                     Navigator.of(context).pop(true);
                       SystemNavigator.pop();
                     
                    },
                    child: const Text('Si')),
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop(false);
                     
                    },
                    child: const Text('No')),
              ],
            )
          ],
        );
      });
}

_dismissDialog(context) {
  Navigator.pop(context);
}
