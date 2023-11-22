import 'package:flutter/material.dart';

void camposIncorrecto(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
             
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: ),
                    const Text(
                      'Cantidad de votos incorrecta',
                      maxLines: 22,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () async {
                        _dismissDialog(context);

                      
                      },
                      child: const Text('Aceptar')),
                 
                ],
              ))
            ],
          );
        });
  }

 
_dismissDialog(context) {
  Navigator.pop(context);
}