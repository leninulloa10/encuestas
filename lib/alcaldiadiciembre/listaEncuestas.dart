import 'dart:convert';
import 'dart:io';

import 'package:app_encuestas/alcaldiadiciembre/models/bdDiciembre.dart';
import 'package:app_encuestas/alcaldiadiciembre/services/encuestasService.dart';
import 'package:app_encuestas/conteo/models/BD.dart';
import 'package:app_encuestas/conteo/showdialogs/guardado.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class listaEncuestasDiciembre extends StatefulWidget {
  const listaEncuestasDiciembre({super.key});

  @override
  State<listaEncuestasDiciembre> createState() =>
      _listaEncuestasDiciembreState();
}

class _listaEncuestasDiciembreState extends State<listaEncuestasDiciembre> {
  var listaborrada = [];
  encuestasServiceDiciembre gtxencuestaService =
      Get.put(encuestasServiceDiciembre());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Text("Lista Pendiente"),
          )
        ],
      ),
      body: Obx(() => gtxencuestaService.esperar.value == false
          ? SingleChildScrollView(
              child: Column(
              children: [
                for (int i = 0;
                    i < gtxencuestaService.arraysql[0].length;
                    i++) ...[
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Card(
                        color: Colors.white70,
                        elevation: 9,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: GestureDetector(
                                  onTap: () async {
                                    gtxencuestaService.esperar.value = true;

                                    gtxencuestaService.esperar.value = false;
                                  },
                                  child: Container(
                                      child: Icon(
                                    Icons.upload,
                                    color: Colors.red,
                                    size: 40,
                                  ))),
                              title: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Text("Id de la Encuesta realizada " +
                                    gtxencuestaService.arraysql[0][i]["id"]
                                        .toString()),
                              ),
                              subtitle: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(gtxencuestaService
                                            .arraysql[0][i]["date"]
                                            .toString()
                                            .split(".")[0]
                                            .toString()),
                                      ),
                                      Container(
                                        child: Text(gtxencuestaService
                                            .arraysql[0][i]["genero"].toString()),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                Obx(() => gtxencuestaService.arraysql[0].length == 0
                    ? Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text("No existen datos por sincronizar",textAlign: TextAlign.center,),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                        child: TextButton(
                          onPressed: () async {
                            gtxencuestaService.esperar.value = true;

                            var r = await gtxencuestaService.GuardarTodo();
                            if (r >= 200 && r < 300) {
                              //borrarLocalstorage();
                              //consultar de nuevo
                              await BDDiciembre.delete();
                              await BDDiciembre.getTodo();
                              sincronizadoExito(context);
                              gtxencuestaService.esperar.value = false;
                            } else {
                              sincronizadoError(context);
                              gtxencuestaService.esperar.value = false;
                            }
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 5),
                            backgroundColor:
                                Colors.blue, // Color de fondo del botón
                            elevation: 5,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Radio de las esquinas
                            ),
                          ),
                          child: Container(
                            width: 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "Sincronizar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.white, // Color del texto del botón
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ))
              ],
            ))
          : Container(
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ))),
    );
  }
}
