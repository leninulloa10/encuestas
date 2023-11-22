import 'dart:convert';
import 'dart:io';

import 'package:app_encuestas/conteo/models/BD.dart';
import 'package:app_encuestas/conteo/services/conteoservice.dart';
import 'package:app_encuestas/conteo/showdialogs/guardado.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class porSincronizarPage extends StatefulWidget {
  const porSincronizarPage({super.key});

  @override
  State<porSincronizarPage> createState() => _porSincronizarPageState();
}

class _porSincronizarPageState extends State<porSincronizarPage> {
  var listaborrada = [];
  conteoServices gtxconteoService = Get.put(conteoServices());
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
      body: Obx(() => gtxconteoService.esperar.value == false
          ? SingleChildScrollView(
              child: Column(
              children: [
                for (int i = 0;
                    i < gtxconteoService.arrayqslite[0].length;
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
                                    gtxconteoService.esperar.value = true;
                                    final bytes = File(gtxconteoService
                                            .arrayqslite[0][i]["photo"]!)
                                        .readAsBytesSync();
                                    String img64 = base64Encode(bytes);
                                    print("la imagem 64");
                                    print(img64);

                                    Map data = {
                                      "precinctName": gtxconteoService
                                          .arrayqslite[0][i]["recinto"]
                                          .toString(),
                                      "deskGender": gtxconteoService
                                          .arrayqslite[0][i]["genero"]
                                          .toString(),
                                      "deskNumber": gtxconteoService
                                          .arrayqslite[0][i]["mesa"],
                                      "sebastianDavalos":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadIgnacioDavalos"],
                                      "xavierVilcacundo":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadXavierVilca"],
                                      "felipeBonilla":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadFelioeBonilla"],
                                      "carlosOrtega":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadCarlosOrtega"],
                                      "myriamAuz":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadMyriamAuz"],
                                      "dianaCaiza":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadDianaCaiza"],
                                      "salomeMarin":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadSalomemarin"],
                                      "luisAmoroso":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadLuisAmoroso"],
                                      "javierAltamirano":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadXavierVilca"],
                                      "blankVotes": gtxconteoService
                                          .arrayqslite[0][i]["cantidadBlancos"],
                                      "nullVotes": gtxconteoService
                                          .arrayqslite[0][i]["cantidadNulos"],
                                      "total": gtxconteoService.arrayqslite[0]
                                          [i]["cantidadTotal"],
                                      "image": img64.toString(),
                                      "imagePath": gtxconteoService
                                          .arrayqslite[0][i]["photo"]!
                                    };

                                    var r = await gtxconteoService
                                        .guardarOnline(data);
                                    listaborrada.clear();
                                    print(
                                        "________guardar online________________");
                                    var auxid = gtxconteoService.arrayqslite[0]
                                        [i]["id"];
                                    print("rrrrrrrrrrrrrrrrrr");
                                  
                                    print(r);
                                    if (r >= 200 && r < 300) {
                                      
                                     
                                     print("se guardo correctamente");
                                      await BD.update(auxid);
                                      gtxconteoService.arrayqslite.clear();
                                      gtxconteoService.arrayqslite
                                          .add(await BD.getTodo());
                                       await   sincronizadoExito(context);
                                    }else{
                                      sincronizadoError(context);
                                    }

                                    gtxconteoService.esperar.value = false;
                                  },
                                  child: Container(
                                      child: Icon(
                                    Icons.upload,
                                    color: Colors.red,
                                    size: 40,
                                  ))),
                              title: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Text("MESA:  " +
                                    gtxconteoService.arrayqslite[0][i]["mesa"]
                                        .toString()),
                              ),
                              subtitle: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          child: Text("Parroquia:  " +
                                              gtxconteoService.arrayqslite[0][i]
                                                      ["parroquia"]
                                                  .toString())),
                                      Container(
                                          width: double.infinity,
                                          child: Text("Recinto:  " +
                                              gtxconteoService.arrayqslite[0][i]
                                                      ["recinto"]
                                                  .toString())),
                                      Container(
                                        width: double.infinity,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1),
                                        child: Text("TOTAL:  " +
                                            gtxconteoService.arrayqslite[0][i]
                                                    ["cantidadTotal"]
                                                .toString()),
                                      )
                                    ],
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 1),
                                      child: Text(
                                        'Sincronizar',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  onPressed: () async {
                                   gtxconteoService.esperar.value = true;
                                    final bytes = File(gtxconteoService
                                            .arrayqslite[0][i]["photo"]!)
                                        .readAsBytesSync();
                                    String img64 = base64Encode(bytes);
                                    print("la imagem 64");
                                    print(img64);

                                    Map data = {
                                      "precinctName": gtxconteoService
                                          .arrayqslite[0][i]["recinto"]
                                          .toString(),
                                      "deskGender": gtxconteoService
                                          .arrayqslite[0][i]["genero"]
                                          .toString(),
                                      "deskNumber": gtxconteoService
                                          .arrayqslite[0][i]["mesa"],
                                      "sebastianDavalos":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadIgnacioDavalos"],
                                      "xavierVilcacundo":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadXavierVilca"],
                                      "felipeBonilla":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadFelioeBonilla"],
                                      "carlosOrtega":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadCarlosOrtega"],
                                      "myriamAuz":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadMyriamAuz"],
                                      "dianaCaiza":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadDianaCaiza"],
                                      "salomeMarin":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadSalomemarin"],
                                      "luisAmoroso":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadLuisAmoroso"],
                                      "javierAltamirano":
                                          gtxconteoService.arrayqslite[0][i]
                                              ["cantidadXavierVilca"],
                                      "blankVotes": gtxconteoService
                                          .arrayqslite[0][i]["cantidadBlancos"],
                                      "nullVotes": gtxconteoService
                                          .arrayqslite[0][i]["cantidadNulos"],
                                      "total": gtxconteoService.arrayqslite[0]
                                          [i]["cantidadTotal"],
                                      "image": img64.toString(),
                                      "imagePath": gtxconteoService
                                          .arrayqslite[0][i]["photo"]!
                                    };

                                    var r = await gtxconteoService
                                        .guardarOnline(data);
                                    listaborrada.clear();
                                    print(
                                        "________guardar online________________");
                                    var auxid = gtxconteoService.arrayqslite[0]
                                        [i]["id"];
                                    print("rrrrrrrrrrrrrrrrrr");
                                  
                                    print(r);
                                    if (r >= 200 && r < 300) {
                                      
                                     
                                     print("se guardo correctamente");
                                      await BD.update(auxid);
                                      gtxconteoService.arrayqslite.clear();
                                      gtxconteoService.arrayqslite
                                          .add(await BD.getTodo());
                                       await   sincronizadoExito(context);
                                    }else{
                                      sincronizadoError(context);
                                    }

                                    gtxconteoService.esperar.value = false;
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
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
