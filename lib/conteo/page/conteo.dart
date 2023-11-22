import 'dart:convert';
import 'dart:io';
import 'package:app_encuestas/conteo/models/BD.dart';
import 'package:app_encuestas/conteo/models/conteoModel.dart';
import 'package:app_encuestas/conteo/page/showdialogssumar.dart';
import 'package:app_encuestas/conteo/services/conteoservice.dart';
import 'package:app_encuestas/conteo/showdialogs/camposincorrectos.dart';
import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:app_encuestas/share/showdialog/camposvacios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../menu/showdialogs/deseaSalirApp.dart';
import '../showdialogs/guardado.dart';

class conteoVotacionesPage extends StatefulWidget {
  const conteoVotacionesPage({super.key});

  @override
  State<conteoVotacionesPage> createState() => _conteoVotacionesPageState();
}

class _conteoVotacionesPageState extends State<conteoVotacionesPage> {
  File? _image;
  var parroquiaSelected = "Seleccionar parroquia";
  var recintoSelected = "seleccionar Recinto";
  var generoSelected = "seleccionar Género";
  var mesaSelected = "seleccionar Mesa";
  conteoServices gtxconteoService = Get.put(conteoServices());
  enviroment gtxenviroment = Get.put(enviroment());
  var dropdownvalue;
  Future _pickimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
    });
    print("@@@@@@@@@@");
    print(_image);
    return _image;
  }

  var listarecintos = [];
  var txtignacio = TextEditingController();
  var txtluismedardo = TextEditingController();
  var txtfelipebonilla = TextEditingController();
  var txtsalomemarin = TextEditingController();
  var txtdianacaiza = TextEditingController();
  var txtluisamoroso = TextEditingController();
  var txtjavieraltamirano = TextEditingController();
  var txtnulos = TextEditingController();
  var txtblanco = TextEditingController();
  int auxtotal = 0;
  var txtxaviervilca = TextEditingController();
  var txtmyriamAuz = TextEditingController();
  var txtCarlosOrtega = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          deseaSalirdeLaapp(context);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(centerTitle: true, actions: [
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Datos del Recinto",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ]),
            body: Obx(
              () => gtxconteoService.esperar.value == false
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Seleccione Parroquia",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Container(
                                          width: 230,
                                          child: Text(parroquiaSelected)),
                                      items:
                                          gtxenviroment.jsonJuntas.map((item) {
                                        return DropdownMenuItem(
                                          value: item['parroquia']![0]
                                              ['nombre_parroquia'],
                                          child: Text(item['parroquia']![0]
                                                  ['nombre_parroquia']
                                              .toString()),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) async {
                                        print(
                                            "#############newValueparroquia######");
                                        print(newVal.toString());
                                        gtxconteoService.esperar.value = true;
                                        gtxconteoService.listarecintos.clear();
                                        gtxconteoService.parroquia.value =
                                            newVal.toString();
                                        setState(() {
                                          dropdownvalue = newVal;
                                          parroquiaSelected = newVal.toString();
                                        });

                                        if (newVal == "" || newVal == null) {
                                          print("no estan cargadas parroquias");
                                          gtxconteoService.esperar.value =
                                              false;
                                        } else {
                                          var r = await buscarJunta(newVal);

                                          if (newVal == "ATOCHA FICOA" ||
                                              newVal == "CELIANO MONGE" ||
                                              newVal == "HUACHI CHICO" ||
                                              newVal == "HUACHI LORETO" ||
                                              newVal == "LA MATRIZ" ||
                                              newVal == "LA MERCED" ||
                                              newVal == "LA PENINSULA" ||
                                              newVal == "PISHILATA" ||
                                              newVal == "SAN FRANCISCO") {
                                            setState(() {
                                              gtxconteoService.sector.value =
                                                  "URBANO";
                                            });

                                            print("sector urbano");
                                            gtxconteoService.esperar.value =
                                                false;
                                          } else {
                                            gtxconteoService.sector.value =
                                                "RURAL";
                                            print("sector rural");
                                            gtxconteoService.esperar.value =
                                                false;
                                          }
                                          gtxconteoService.esperar.value =
                                              false;
                                        }
                                        print("el sector definido es ");
                                        print(gtxconteoService.sector.value);

                                        gtxconteoService.esperar.value = false;
                                      },
                                    ),
                                  ))),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Seleccione Recinto",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              alignment: Alignment.center,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                  hint: Container(
                                      width: 230,
                                      child: Text(
                                        recintoSelected,
                                        style: TextStyle(fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  items: gtxconteoService.listarecintos
                                      .map((item) {
                                    return DropdownMenuItem<dynamic>(
                                      value: item.toString(),
                                      child: Container(
                                        width: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                //margin: EdgeInsets.symmetric(vertical: 3),
                                                child: Text(
                                                  item.toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Divider()
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (x) {
                                    print("recinto selemnccinado es ");
                                    print(recintoSelected);
                                    gtxconteoService.recinto.value = x;
                                    setState(() {
                                      recintoSelected = x!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Seleccione Genero",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                                hint: Container(
                                    width: 230,
                                    child: Text(
                                      generoSelected,
                                      style: TextStyle(fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                items: ["Masculino", "Femenino"].map((item) {
                                  return DropdownMenuItem<dynamic>(
                                    value: item.toString(),
                                    child: Container(
                                      width: 200,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              //margin: EdgeInsets.symmetric(vertical: 3),
                                              child: Text(
                                                item.toString(),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (x) async {
                                  setState(() {
                                    generoSelected = x!;
                                  });
                                  gtxconteoService.genero.value = x!;
                                },
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Seleccione Mesa",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                                hint: Container(
                                    alignment: Alignment.center,
                                    width: 230,
                                    child: Text(
                                      mesaSelected,
                                      style: TextStyle(fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                items: [
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10",
                                  "11",
                                  "12",
                                  "13",
                                  "14",
                                  "15"
                                ].map((item) {
                                  return DropdownMenuItem<dynamic>(
                                    value: item.toString(),
                                    child: Container(
                                      width: 200,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              //margin: EdgeInsets.symmetric(vertical: 3),
                                              child: Text(
                                                item.toString(),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (x) async {
                                  setState(() {
                                    mesaSelected = x!;
                                  });
                                  gtxconteoService.mesa.value = int.parse(x!);
                                },
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Text(
                                "Ingrese el número de votos de cada candidato",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                                Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Blancos")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtblanco,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtblanco.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtblanco.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Nulos")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        controller: txtnulos,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtnulos.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtnulos.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Ignacio Davalos")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtignacio.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtignacio.text = "";
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        controller: txtignacio,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Xavier Vilcacundo")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtxaviervilca,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtxaviervilca.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtxaviervilca.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Myriam  Auz")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtmyriamAuz,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtmyriamAuz.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtmyriamAuz.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Carlos Ortega")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtCarlosOrtega,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtCarlosOrtega.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtCarlosOrtega.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Felipe Bonilla")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtfelipebonilla,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtfelipebonilla.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtfelipebonilla.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Salome Marín")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtsalomemarin,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtsalomemarin.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtsalomemarin.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Diana Caiza")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtdianacaiza,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtdianacaiza.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtdianacaiza.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Luis Amoroso")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtluisamoroso,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtluisamoroso.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtluisamoroso.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Javier Altamirano")),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: txtjavieraltamirano,
                                        onChanged: (val) async {
                                          if (int.parse(val) >= 351) {
                                            camposfueradelimite(context);
                                            txtjavieraltamirano.text = "";
                                          }
                                          var rs = await sumarVotos();
                                          if (rs["status"] == "ok") {
                                          } else {
                                            mensajeErrorSuma(context);
                                            txtjavieraltamirano.text = "";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                          Divider(),
                        
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(auxtotal.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ),
                          Divider(),
                          TextButton(
                              onPressed: () async {
                                gtxconteoService.esperar.value = true;
                                if (txtignacio.text == "" ||
                                    txtxaviervilca.text == "" ||
                                    txtmyriamAuz.text == "" ||
                                    txtCarlosOrtega.text == "" ||
                                    txtfelipebonilla.text == "" ||
                                    txtsalomemarin.text == "" ||
                                    txtdianacaiza.text == "" ||
                                    txtluisamoroso.text == "" ||
                                    txtjavieraltamirano.text == "" ||
                                    txtblanco.text == "" ||
                                    txtnulos.text == "") {
                                  camposIncorrecto(context);
                                  gtxconteoService.esperar.value = false;
                                } else {
                                  camaraGaleria(context);

                                  gtxconteoService.esperar.value = false;
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                        width: 2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.center,
                                  //color: Colors.blue,
                                  margin: EdgeInsets.symmetric(vertical: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                            color: Colors.white,
                                            Icons.camera_alt),
                                      ),
                                      Text(
                                        "Tomar Fotografía",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: _image?.path == null || _image?.path == ""
                                  ? Container()
                                  : Image.file(File(_image!.path))),
                          Divider(),
                          TextButton(
                              onPressed: () async {
                                gtxconteoService.esperar.value = true;

                                // print("el path de la bfoto es ");
                                // print(_image?.path.toString()==null?"nuloooo":"campos");
                                if (parroquiaSelected ==
                                        "Seleccionar parroquia" ||
                                    recintoSelected == "seleccionar Recinto" ||
                                    txtignacio.text.trim() == "" ||
                                    txtxaviervilca.text.trim() == "" ||
                                    txtmyriamAuz.text.trim() == "" ||
                                    txtCarlosOrtega.text.trim() == "" ||
                                    txtfelipebonilla.text.trim() == "" ||
                                    txtsalomemarin.text.trim() == "" ||
                                    txtdianacaiza.text.trim() == "" ||
                                    txtluisamoroso.text.trim() == "" ||
                                    txtjavieraltamirano.text.trim() == "" ||
                                    txtblanco == "".trim() ||
                                    txtnulos == "".trim() ||
                                    _image?.path == null ||
                                    generoSelected == "seleccionar Género" ||
                                    mesaSelected == "seleccionar Mesa") {
                                  camposVacios(context);
                                  gtxconteoService.esperar.value = false;
                                } else {
                                  gtxconteoService.nulos.value =
                                      int.parse(txtnulos.text.trim());
                                  gtxconteoService.blancos.value =
                                      int.parse(txtblanco.text.trim());
                                  gtxconteoService.total.value = auxtotal;
                                  gtxconteoService
                                          .cantidadIgnacioDavalos.value =
                                      int.parse(txtignacio.text.trim());
                                  gtxconteoService.cantidadXavierVilca.value =
                                      int.parse(txtxaviervilca.text.trim());

                                  gtxconteoService.cantidadMyriamAuz.value =
                                      int.parse(txtmyriamAuz.text.trim());
                                  gtxconteoService.cantidadCarlosOrtega.value =
                                      int.parse(txtCarlosOrtega.text.trim());

                                  gtxconteoService.cantidadFelioeBonilla.value =
                                      int.parse(txtfelipebonilla.text.trim());
                                  gtxconteoService.cantidadSalomemarin.value =
                                      int.parse(txtsalomemarin.text.trim());
                                  gtxconteoService.cantidadDianaCaiza.value =
                                      int.parse(txtdianacaiza.text.trim());
                                  gtxconteoService.cantidadLuisAmoroso.value =
                                      int.parse(txtluisamoroso.text.trim());
                                  gtxconteoService
                                          .cantidadJavierAltamirano.value =
                                      int.parse(
                                          txtjavieraltamirano.text.trim());
                                  gtxconteoService.photo.value =
                                      _image!.path.toString();
                                  var conteoNuevo = new conteoModel(
                                      parroquia:
                                          gtxconteoService.parroquia.value,
                                      sector: gtxconteoService.sector.value,
                                      genero: gtxconteoService.genero.value,
                                      mesa: gtxconteoService.mesa.value,
                                      recinto: gtxconteoService.recinto.value,
                                      cantidadIgnacioDavalos: gtxconteoService
                                          .cantidadIgnacioDavalos.value,
                                      cantidadXavierVilca: gtxconteoService
                                          .cantidadXavierVilca.value,
                                      cantidadCarlosOrtega: gtxconteoService
                                          .cantidadCarlosOrtega.value,
                                      cantidadMyriamAuz: gtxconteoService
                                          .cantidadMyriamAuz.value,
                                      cantidadFelioeBonilla: gtxconteoService
                                          .cantidadFelioeBonilla.value,
                                      cantidadSalomemarin: gtxconteoService
                                          .cantidadSalomemarin.value,
                                      cantidadDianaCaiza: gtxconteoService
                                          .cantidadDianaCaiza.value,
                                      cantidadLuisAmoroso: gtxconteoService
                                          .cantidadLuisAmoroso.value,
                                      cantidadJavierAltamirano: gtxconteoService
                                          .cantidadJavierAltamirano.value,
                                      cantidadNulos:
                                          gtxconteoService.nulos.value,
                                      cantidadBlancos:
                                          gtxconteoService.blancos.value,
                                      cantidadTotal: gtxconteoService.total.value,
                                      photo: gtxconteoService.photo.value,
                                      imagePath: _image?.path.toString(),
                                      visible: 1);
                                  var r = await BD.insert(conteoNuevo);
                                  print(
                                      "%%%%%%%%%%%la insercion devuelve%%%%%%%%%%%%%%");
                                  print(r.toString());
                                  if (r != null || r != "") {
                                    guardadoExitoSQLLITE(context);
                                  } else {
                                    errorGuardadoSQLLITE(context);
                                  }

                                  gtxconteoService.esperar.value = false;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border:
                                      Border.all(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: double.infinity,
                                height: 50,
                                alignment: Alignment.center,
                                //color: Colors.blue,
                                margin: EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 20),
                                child: Text(
                                  "Guardar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                      child: CircularProgressIndicator(),
                    )),
            )));
  }

  Future<dynamic> sumarVotos() async {
    var valor1 = txtignacio.text != "" ? int.parse(txtignacio.text) : 0;
    var valor2 =
        txtCarlosOrtega.text != "" ? int.parse(txtCarlosOrtega.text) : 0;
    var valor3 = txtxaviervilca.text != "" ? int.parse(txtxaviervilca.text) : 0;
    var valor4 = txtmyriamAuz.text != "" ? int.parse(txtmyriamAuz.text) : 0;
    var valor5 =
        txtfelipebonilla.text != "" ? int.parse(txtfelipebonilla.text) : 0;
    var valor6 = txtsalomemarin.text != "" ? int.parse(txtsalomemarin.text) : 0;
    var valor7 = txtdianacaiza.text != "" ? int.parse(txtdianacaiza.text) : 0;
    var valor8 = txtluisamoroso.text != "" ? int.parse(txtluisamoroso.text) : 0;

    var valor9 = txtjavieraltamirano.text != ""
        ? int.parse(txtjavieraltamirano.text)
        : 0;
    var valor10 = txtblanco.text != "" ? int.parse(txtblanco.text) : 0;
    var valor11 = txtnulos.text != "" ? int.parse(txtnulos.text) : 0;

    var aux = valor1 +
        valor2 +
        valor3 +
        valor4 +
        valor5 +
        valor6 +
        valor7 +
        valor8 +
        valor9 +
        valor10 +
        valor11;

    setState(() {
      auxtotal = aux;
    });
    if (auxtotal > 350) {
      return ({"status": "ko"});
    } else {
      return ({"status": "ok"});
    }
  }

  Future<dynamic> buscarJunta(parame) async {
    gtxconteoService.listaauxRecintos.clear();

    for (int i = 0; i < gtxenviroment.jsonJuntas.length; i++) {
      if (gtxenviroment.jsonJuntas[i]['parroquia']![0]["nombre_parroquia"] ==
          parame) {
        gtxconteoService.listaauxRecintos
            .add(gtxenviroment.jsonJuntas[i]["recintos"]);
        print("lista recintos");
        print(gtxconteoService.listaauxRecintos[0].toString());
        print(gtxconteoService.listaauxRecintos[0].length.toString());
        // print(gtxenviroment.jsonJuntas[i]["recintos"].length.toString());
        gtxconteoService.listarecintos.clear();
        for (int j = 0; j < gtxconteoService.listaauxRecintos[0].length; j++) {
          print("##########");
          print(gtxconteoService.listaauxRecintos[0][j]["nombre_recinto"]);

          gtxconteoService.listarecintos.add(gtxconteoService
              .listaauxRecintos[0][j]["nombre_recinto"]
              .toString());
        }
        print("_________________");
        print(gtxconteoService.listarecintos.toString());
        print(gtxconteoService.listarecintos.length.toString());
        return "ok";
      }
    }
  }

  String? numberValidator(String value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  }

  void camaraGaleria(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: ),
                  TextButton(
                      onPressed: () async {
                        var r = await _pickimage(ImageSource.camera);
                        print("Respuesta del camara es ");
                        print(r);
                        _dismissDialog(context);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/alcaldes/camara.png'),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 75,
                              child: Text("Cámara",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      )),
                  TextButton(
                      onPressed: () async {
                        var r = await _pickimage(ImageSource.gallery);
                        print("Respuesta del camara es ");
                        print(r);
                        _dismissDialog(context);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/alcaldes/galeria.png'),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 75,
                              child: Text("Galería",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
            ],
          );
        });
  }

  _dismissDialog(context) {
    Navigator.pop(context);
  }
}
