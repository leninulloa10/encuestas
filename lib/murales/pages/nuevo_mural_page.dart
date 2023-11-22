// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:app_encuestas/murales/services/muralesServices.dart';
import 'package:app_encuestas/murales/share/exitoGuardado.dart';
import 'package:app_encuestas/share/showdialog/camposvacios.dart';
import 'package:app_encuestas/share/showdialog/guardadoexito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NuevoMuralPage extends StatefulWidget {
  const NuevoMuralPage({Key? key}) : super(key: key);

  @override
  State<NuevoMuralPage> createState() => _NuevoMuralPageState();
}

class _NuevoMuralPageState extends State<NuevoMuralPage> {
  muralesServices gtxmurales = Get.put(muralesServices());
  var sector = "";
  var txtpropietario = TextEditingController();
  var txttelefono = TextEditingController();
  var txtdireccion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF97950),
        ),
        body: Obx(() => gtxmurales.esperar.value == false
            ? Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        //TITULO
                        Text(
                          'Nuevo Mural',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        //PROPIETARIO
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: TextFormField(
                            controller: txtpropietario,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Propietario',
                                hintText:
                                    'Ingrese los nombres del propietario'),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              " Seleccione parroquia",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        //PARROQUIA
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: DropdownButton(
                                    underline: Container(
                                      decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide.none),
                                      ),
                                    ),
                                    hint: Obx(
                                        () => Text(gtxmurales.parroquia.value)),
                                    items: [
                                      "ATOCHA–FICOA",
                                      "CELIANO MONGE",
                                      "HUACHI CHICO",
                                      "HUACHI LORETO",
                                      "LA MERCED",
                                      "LA PENÍNSULA",
                                      "MATRIZ",
                                      "PISHILATA",
                                      "SAN FRANCISCO",
                                      "AMBATILLO",
                                      "ATAHUALPA ",
                                      "AUGUSTO N. MARTÍNEZ",
                                      "CONSTANTINO FERNÁNDEZ",
                                      "HUACHI GRANDE",
                                      "IZAMBA",
                                      "JUAN BENIGNO VELA",
                                      "MONTALVO",
                                      "PASA",
                                      "PICAIGUA",
                                      "PILAGÜÍN",
                                      "QUISAPINCHA ",
                                      "SAN BARTOLOMÉ DE PINLLOG",
                                      "SAN FERNANDO",
                                      "SANTA ROSA",
                                      "TOTORAS",
                                      "CUNCHIBAMBA",
                                      "UNAMUNCHO"
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (x) async {
                                      gtxmurales.esperar.value =true;
                                      gtxmurales.parroquia.value = x!;

                                      if (x == "ATOCHA–FICOA" ||
                                          x == "CELIANO MONGE" ||
                                          x == "HUACHI CHICO" ||
                                          x == "HUACHI LORETO" ||
                                          x == "MATRIZ" ||
                                          x == "LA MERCED" ||
                                          x == "LA PENÍNSULA" ||
                                          x == "PISHILATA" ||
                                          x == "SAN FRANCISCO") {
                                        setState(() {
                                          sector = "URBANO";
                                        });
                                        gtxmurales.sector.value = "URBANO";
                                        print("sector urbano");
                                        gtxmurales.esperar.value =false;
                                      } else {
                                        sector = "RURAL";
                                        gtxmurales.sector.value = "RURAL";
                                        print("sector rural");
                                        gtxmurales.esperar.value =false;
                                      }
                                      gtxmurales.esperar.value =false;
                                    }))),
                        //TELEFONO
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: txttelefono,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Numero de telefono',
                                hintText:
                                    'Ingrese un numero de telefono valido'),
                          ),
                        ),
                        //DIRECCION
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: TextFormField(
                            controller: txtdireccion,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Direccion',
                                hintText:
                                    'Ingrese la direccion de la propiedad'),
                          ),
                        ),

                        //ingresar

                        TextButton(
                          onPressed: () async {
                            gtxmurales.esperar.value = true;

                            if (txtpropietario.text == "" ||
                                txtdireccion.text == "" ||
                                txttelefono.text == "" ||
                                sector==""
                              ) {
                              camposVacios(context);
                              gtxmurales.esperar.value = false;
                            } else {
                              gtxmurales.nombrescompletos.value =
                                  txtpropietario.text;
                              gtxmurales.telefono.value = txttelefono.text;
                              gtxmurales.direccion.value = txtdireccion.text;
                           
                               await gtxmurales.GuardarOffline();
                                guardadoExxitosmurales(context);
                              await  gtxmurales.getNumberEncuestas();
                              gtxmurales.esperar.value = false;
                            }
                            gtxmurales.esperar.value = false;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            width: double.infinity,
                            color: Color(0xFFF97950),
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Guardar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )));
  }
}
