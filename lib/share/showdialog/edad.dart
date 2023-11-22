import 'package:flutter/material.dart';


void edadIncorrecta(context) {
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
                      'La edad no corresponde',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: ),
                  const Text(
                    'al rango de consulta',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
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
  void solotresopciones(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
             
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:
                     Text(
                      'Error en Pregunta 2',
                      maxLines: 22,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.center,
                    )),
                   
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: ),
                  const Text(
                    'Máximo 3 opciones',
                    maxLines: 22,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
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