import 'dart:convert';

import 'package:app_encuestas/encuesta/services/encuestaService.dart';
import 'package:app_encuestas/murales/share/exitoGuardado.dart';
import 'package:app_encuestas/share/showdialog/camposvacios.dart';
import 'package:app_encuestas/share/showdialog/edad.dart';
import 'package:app_encuestas/share/showdialog/guardadoexito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'exitoguardado2.dart';

class encuestaPage extends StatefulWidget {
  const encuestaPage({super.key});

  @override
  State<encuestaPage> createState() => _encuestaPageState();
}

class _encuestaPageState extends State<encuestaPage> {
  var op1 = false;

  encuestaService gtxencuestaService = Get.put(encuestaService());

  int contador = 0;
  var genero = "genero";
  var votaenAmbato = "Seleccionar";
  var parroquiaSelected = "Seleccionar";

  var sector = "";
  var pregunta3 = "false";
  var edad = TextEditingController();
  bool esConocido = false;
  bool perfilAdecuado = false;
  bool esmujer = false;
  bool eshonesto = false;
  bool esadmin = false;
  bool tieneliderazgo = false;
  bool conoceCiudad = false;
  bool tienebuenequipo = false;
  bool otro = false;
  bool desconoce = false;
  //strings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF97950),
        ),
        body: Obx(() => gtxencuestaService.esperar.value == false
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "MENCIONAR:    Usted vota en el cantón Ambato",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "	Sí (Continúa con la encuesta)",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "No (NO REALIZA ENCUESTA)",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Divider(),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          "Seleccione la Parroquia",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: DropdownButton(
                          underline: Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide.none),
                            ),
                          ),
                          hint: Text(parroquiaSelected),
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
                            gtxencuestaService.parroquias.value = x!;

                            if (x == "" || x == null) {
                              print("no estan cargadas parroquias");
                            } else {
                              setState(() {
                                parroquiaSelected = x!;
                              });
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
                                gtxencuestaService.sector.value = "URBANO";
                                print("sector urbano");
                              } else {
                                sector = "RURAL";
                                gtxencuestaService.sector.value = "RURAL";
                                print("sector rural");
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          " Seleccione el género",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: DropdownButton(
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        hint: Text(genero),
                        items: ['MASCULINO', 'FEMENINO', "OTRO"]
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (x) {
                          setState(() {
                            genero = x!;
                          });
                          gtxencuestaService.genero.value = x!;
                        },
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: const Text(
                          " Ingrese Edad (mayor a 16)",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextField(
                          onChanged: (value) async {
                            if (value.length > 2) {
                              edadIncorrecta(context);
                              edad.text = "";
                            } else {
                              print("edad correcta");
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: edad,
                        )),

                    Divider(),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          " 1.	En la próxima elección (5 de febrero de 2023) por quién votará para alcalde de Ambato?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Sebastián Dávalos Sánchez",
                                    value: "Ignacio Davalos",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {
                                        op1 = true;
                                      });
                                      gtxencuestaService.respuesta1.value =
                                          value!;
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/IGNACIODAVALOS.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Xavier Vilcacundo",
                                    value: "Xavier Vilcacundo",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {
                                        op1 = true;
                                      });
                                      gtxencuestaService.respuesta1.value =
                                          value!;
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/XAVIERVILCACUNDO.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Myriam Auz",
                                    value: "Myriam Auz",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {
                                        op1 = true;
                                      });
                                      gtxencuestaService.respuesta1.value =
                                          value!;
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/MYRIAMAUZ.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Felipe Bonilla",
                                    value: "Felipe Bonilla",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {
                                        op1 = true;
                                      });
                                      gtxencuestaService.respuesta1.value =
                                          value!;
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/FELIPEBONILLA.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Carlos Ortega",
                                    value: "Carlos Ortega",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {
                                        op1 = true;
                                      });
                                      gtxencuestaService.respuesta1.value =
                                          value!;
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/CARLOSORTEGA.png'),
                              ),
                            ),
                          ],
                        )),

                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Salomé Marín",
                                    value: "Salomé Marín",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {});
                                      gtxencuestaService.respuesta1.value =
                                          value.toString();
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/SALOMEMARIN.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Diana Caiza",
                                    value: "Diana Caiza",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {});
                                      gtxencuestaService.respuesta1.value =
                                          value.toString();
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/DIANACAIZA.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Luis Amoroso",
                                    value: "Luis Amoroso",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {});
                                      gtxencuestaService.respuesta1.value =
                                          value.toString();
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/LUISAMOROSO.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Javier Altamirano",
                                    value: "Javier Altamirano",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {});
                                      gtxencuestaService.respuesta1.value =
                                          value.toString();
                                      gtxencuestaService
                                          .aparecepregunta2.value = true;
                                    }),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/alcaldes/JAVIERALTAMIRANO.png'),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "No se decide aún (Blanco)",
                                    value: "Blanco",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {});
                                      gtxencuestaService.respuesta1.value =
                                          value.toString();
                                      gtxencuestaService
                                          .aparecepregunta2.value = false;
                                    }),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: RadioButton(
                                    description: "Ninguno (nulo)",
                                    value: "nulo",
                                    groupValue:
                                        gtxencuestaService.respuesta1.value,
                                    onChanged: (value) {
                                      setState(() {});
                                      gtxencuestaService.respuesta1.value =
                                          value.toString();
                                      gtxencuestaService
                                          .aparecepregunta2.value = false;
                                    }),
                              ),
                            ),
                          ],
                        )),
                    Obx(() => gtxencuestaService.aparecepregunta2.value == true
                        ? Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    "2.	Cuáles son las razones por las que decidió votar por… (nombre del candidato) (pregunta abierta – tome solo tres del catálogo)",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: esConocido,
                                        onChanged: (x) async {
                                          setState(() {
                                            esConocido = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: const Text("Es conocido"))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: perfilAdecuado,
                                        onChanged: (x) async {
                                          setState(() {
                                            perfilAdecuado = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "Tiene el perfil adecuado (formación-experiencia-méritos)"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: esmujer,
                                        onChanged: (x) async {
                                          setState(() {
                                            esmujer = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text("Es mujer"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: eshonesto,
                                        onChanged: (x) async {
                                          setState(() {
                                            eshonesto = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "Es honesto (no sea corrupto–rinde cuentas)"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: esadmin,
                                        onChanged: (x) async {
                                          setState(() {
                                            esadmin = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "Es buen administrador (planifique - haga obras - cumpla con su plan de gobierno)"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: tieneliderazgo,
                                        onChanged: (x) async {
                                          setState(() {
                                            tieneliderazgo = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "Tiene liderazgo (que negocie – se ponga frente a los problemas)"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: conoceCiudad,
                                        onChanged: (x) async {
                                          setState(() {
                                            conoceCiudad = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "Conoce la ciudad y sus problemas"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: tienebuenequipo,
                                        onChanged: (x) async {
                                          setState(() {
                                            tienebuenequipo = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "Tiene un buen equipo de trabajo"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: desconoce,
                                        onChanged: (x) async {
                                          setState(() {
                                            desconoce = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text("Desconoce"))))
                                    ],
                                  ) //Checkbox
                                  ),
                              Container(
                                  // alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: otro,
                                        onChanged: (x) async {
                                          setState(() {
                                            otro = x!;
                                          });
                                        },
                                      ),
                                      Container(
                                          child: Expanded(
                                              child: Container(
                                                  child: Text("Otro"))))
                                    ],
                                  ) //Checkbox
                                  ),
                            ],
                          )
                        : Container()),

                    Divider(),
                    TextButton(
                        onPressed: () async {
                          gtxencuestaService.esperar.value = true;

                          if (parroquiaSelected == "Seleccionar" ||
                              genero == "genero" ||
                              gtxencuestaService.respuesta1.value == "") {
                            camposVacios(context);
                          } else {
                            if (edad.text.trim() == "16" ||
                                edad.text.trim() == "15" ||
                                edad.text.trim() == "14" ||
                                edad.text.trim() == "13" ||
                                edad.text.trim() == "12" ||
                                edad.text.trim() == "11" ||
                                edad.text.trim() == "10" ||
                                edad.text.trim() == "9" ||
                                edad.text.trim() == "8" ||
                                edad.text.trim() == "7" ||
                                edad.text.trim() == "6" ||
                                edad.text.trim() == "5" ||
                                edad.text.trim() == "4" ||
                                edad.text.trim() == "3" ||
                                edad.text.trim() == "2" ||
                                edad.text.trim() == "1" ||
                                edad.text.trim() == "" ||
                                edad.text.trim() == "0") {
                              edadIncorrecta(context);
                            } else {
                              gtxencuestaService.edad.value = edad.text.trim();
                              if (esConocido == true) {
                                contador = contador + 1;
                              }
                              if (perfilAdecuado == true) {
                                contador = contador + 1;
                              }
                              if (esmujer == true) {
                                contador = contador + 1;
                              }
                              if (eshonesto == true) {
                                contador = contador + 1;
                              }
                              if (esadmin == true) {
                                contador = contador + 1;
                              }
                              if (tieneliderazgo == true) {
                                contador = contador + 1;
                              }
                              if (conoceCiudad == true) {
                                contador = contador + 1;
                              }
                              if (tienebuenequipo == true) {
                                contador = contador + 1;
                              }
                              if (desconoce == true) {
                                contador = 0;
                                esConocido = false;
                                perfilAdecuado = false;
                                esmujer = false;
                                eshonesto = false;
                                esadmin = false;
                                tieneliderazgo = false;
                                conoceCiudad = false;
                                tienebuenequipo = false;
                                otro = false;
                              }
                              if (otro == true) {
                                contador = 0;
                                esConocido = false;
                                perfilAdecuado = false;
                                esmujer = false;
                                eshonesto = false;
                                esadmin = false;
                                tieneliderazgo = false;
                                conoceCiudad = false;
                                tienebuenequipo = false;
                                desconoce = false;
                              }
                              if (contador > 3) {
                                print("contador");
                                print(contador.toString());
                                solotresopciones(context);
                                contador = 0;
                              } else {
                                if (esConocido == true) {
                                  gtxencuestaService.listaAuxRes2
                                      .add("Es conocido");
                                }
                                if (perfilAdecuado == true) {
                                  gtxencuestaService.listaAuxRes2.add(
                                      "Tiene el perfil adecuado (formación – experiencia – méritos)");
                                }
                                if (esmujer == true) {
                                  gtxencuestaService.listaAuxRes2
                                      .add("Es mujer");
                                }
                                if (eshonesto == true) {
                                  gtxencuestaService.listaAuxRes2.add(
                                      "Es honesto (no sea corrupto – rinde cuentas)");
                                }
                                if (esadmin == true) {
                                  gtxencuestaService.listaAuxRes2.add(
                                      "Es buen administrador (planifique - haga obras - cumpla con su plan de gobierno)");
                                }
                                if (tieneliderazgo == true) {
                                  gtxencuestaService.listaAuxRes2.add(
                                      "Tiene liderazgo (que negocie – se ponga frente a los problemas)");
                                }
                                if (conoceCiudad == true) {
                                  gtxencuestaService.listaAuxRes2
                                      .add("Conoce la ciudad y sus problemas");
                                }
                                if (tienebuenequipo == true) {
                                  gtxencuestaService.listaAuxRes2
                                      .add("Tiene un buen equipo de trabajo");
                                }
                                if (otro == true) {
                                  gtxencuestaService.listaAuxRes2.add("Otro");
                                }

                                var r =
                                    await gtxencuestaService.GuardarOffline();
                                print("######################");
                                print(r);
                                if (r["status"] == "ok") {
                                  guardadoExito2(context);
                                  await gtxencuestaService
                                      .getNumberEncuestasAPI();
                                } else {}
                                contador = 0;
                                await restablecerValores();

                                //   gtxencuestaService.respuesta2=gtxencuestaService.listaAux.toString();

                              }
                            }
                          }
                          gtxencuestaService.esperar.value = false;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          width: double.infinity,
                          color: Color(0xFFF97950),
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Guardar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )),
                    // TextButton(
                    //     onPressed: () {
                    //       gtxencuestaService.getLocalStorage();
                    //     },
                    //     child: Text("ver que tengo en ls")),
                    // TextButton(
                    //     onPressed: () {
                    //       gtxencuestaService.borrarPreferences();
                    //     },
                    //     child: Text("borrar local storage")),
                  ],
                ),
              )
            : Container(child: Center(child: CircularProgressIndicator()))));
  }

  restablecerValores() {
    contador = 0;
    genero = "genero";
    votaenAmbato = "Seleccionar";
    parroquiaSelected = "Seleccionar";

    sector = "";
    pregunta3 = "false";
    edad.text = "";
    esConocido = false;
    perfilAdecuado = false;
    esmujer = false;
    eshonesto = false;
    esadmin = false;
    tieneliderazgo = false;
    conoceCiudad = false;
    tienebuenequipo = false;
    otro = false;
    desconoce = false;
    gtxencuestaService.resetValores();
  }
}
