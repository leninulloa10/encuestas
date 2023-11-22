import 'package:flutter/material.dart';


void errorLogin(context) {
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
                      'Error en las credeenciales',
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