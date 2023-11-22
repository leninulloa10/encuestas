import 'package:flutter/material.dart';


void camposVacios(context) {
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
                      'LLene todos los campos',
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
void camposfueradelimite(context) {
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
                      'Maximo 350',
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