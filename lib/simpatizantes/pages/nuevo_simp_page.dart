// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:app_encuestas/share/showdialog/camposvacios.dart';
import 'package:app_encuestas/share/showdialog/edad.dart';
import 'package:app_encuestas/simpatizantes/services/simps_services.dart';
import 'package:app_encuestas/simpatizantes/share/guardadoexito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class NuevoSimpatizantePage extends StatefulWidget {
  NuevoSimpatizantePage({Key? key}) : super(key: key);

  @override
  State<NuevoSimpatizantePage> createState() => _NuevoSimpatizantePageState();
}

class _NuevoSimpatizantePageState extends State<NuevoSimpatizantePage> {
  SimpatoizanteServices gtxSimpController = Get.put(SimpatoizanteServices());

  var txtnombres = TextEditingController();

  // var sector = "";
  var txtedad = TextEditingController();

  var txtTelefono = TextEditingController();

  var txtCorreo = TextEditingController();
  var radioGenero = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF97950),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Ingreso de Simpatizantes",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
        body: Obx(
          () => gtxsimpatizantes.esperar.value == false
              ? Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                      child: Column(
                        children: [
                          //TITULO
                          Text(
                            '* Te interesaría recibir avisos de empleo en caso de que Diana Caiza gane la alcaldía.',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              '* También Queremos saber las necesidades de tu sector, para estar comunicados.',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              '* Por favor: Ayúdanos con esta información.',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),

                          //TELEFONO
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: txtTelefono,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Numero de telefono',
                                  hintText:
                                      'Ingrese un numero de telefono valido'),
                            ),
                          ),
                          //CORREO
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: txtCorreo,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Correo',
                                  hintText:
                                      'Ingrese una direccion de correo electronico'),
                            ),
                          ),
                          //NOMBRE
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: txtnombres,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nombres',
                                  hintText: 'Ingrese su nombre y apellido'),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "(NO PREGUNTAR)",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: RadioListTile(
                                  title: Text("Masculino"),
                                  value: "MASCULINO",
                                  groupValue: radioGenero,
                                  onChanged: (value) {
                                    setState(() {
                                      radioGenero = value.toString();
                                    });
                                    print("radio masculino");
                                    print(radioGenero);
                                  },
                                ),
                              ),
                              Container(
                                child: RadioListTile(
                                  title: Text("Femenino"),
                                  value: "FEMENINO",
                                  groupValue: radioGenero,
                                  onChanged: (value) {
                                    setState(() {
                                      radioGenero = value.toString();
                                    });
                                    print("radio femenino");
                                    print(radioGenero);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "Ingrese Edad Estimada ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: txtedad,
                                onChanged: (value){

                                 var aux= value.split("");
                                 if(aux.length>=3){
                                  edadIncorrecta(context);
                                 }
                                },
                                 decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  
                                  hintText:
                                      ''),
                              )),
                          //ingresar

                          TextButton(
                            onPressed: () async {
                              gtxSimpController.esperar.value = true;

                              gtxSimpController.nombres.value =
                                  txtnombres.text.trim();

                              gtxSimpController.edad.value =
                                  txtedad.text.trim();
                              gtxSimpController.telefono.value =
                                  txtTelefono.text.trim();
                              gtxSimpController.correo.value =
                                  txtCorreo.text.trim();
                              gtxSimpController.genero.value = radioGenero;
                              if (txtnombres.text == "" ||
                                  gtxSimpController.genero.value == "" ||
                                  txtedad.text == "" ||
                                  txtCorreo.text == "") {
                                camposVacios(context);
                                gtxSimpController.esperar.value = false;
                              } else {
                                if (txtedad.text.trim() == "16" ||
                                    txtedad.text.trim() == "15" ||
                                    txtedad.text.trim() == "14" ||
                                    txtedad.text.trim() == "13" ||
                                    txtedad.text.trim() == "12" ||
                                    txtedad.text.trim() == "11" ||
                                    txtedad.text.trim() == "10" ||
                                    txtedad.text.trim() == "9" ||
                                    txtedad.text.trim() == "8" ||
                                    txtedad.text.trim() == "7" ||
                                    txtedad.text.trim() == "6" ||
                                    txtedad.text.trim() == "5" ||
                                    txtedad.text.trim() == "4" ||
                                    txtedad.text.trim() == "3" ||
                                    txtedad.text.trim() == "2" ||
                                    txtedad.text.trim() == "1" ||
                                    txtedad.text.trim() == "" ||
                                    txtedad.text.trim() == "0") {
                                  edadIncorrecta(context);
                                  gtxSimpController.esperar.value = false;
                                } else {
                                  gtxSimpController.genero.value = radioGenero;
                                  await gtxSimpController.GuardarOffline();

                                  guardadoExxitosimpatizantes(context);

                                  gtxSimpController.esperar.value = false;
                                }
                              }
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),

                          // TextButton(
                          //     onPressed: () {
                          //       gtxSimpController.getLocalStorage();
                          //     },
                          //     child: Text('LOCA')),
                          // TextButton(
                          //     onPressed: () {
                          //       gtxSimpController.borrarPreferences();
                          //     },
                          //     child: Text('BORRA')),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  child: Center(child: CircularProgressIndicator()),
                ),
        ));
  }
}
