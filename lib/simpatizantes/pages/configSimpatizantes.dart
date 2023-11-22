import 'package:app_encuestas/share/showdialog/camposvacios.dart';
import 'package:app_encuestas/simpatizantes/services/simps_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class configSimpatizantesPage extends StatefulWidget {
  const configSimpatizantesPage({super.key});

  @override
  State<configSimpatizantesPage> createState() =>
      _configSimpatizantesPageState();
}

class _configSimpatizantesPageState extends State<configSimpatizantesPage> {
  SimpatoizanteServices gtxSimpController = Get.put(SimpatoizanteServices());
  var sector = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF97950),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  " Seleccione parroquia",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            //PARROQUIA
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: DropdownButton(
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        hint:
                            Obx(() => Text(gtxSimpController.parroquia.value)),
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
                          gtxSimpController.parroquia.value = x!;

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
                            gtxSimpController.sector.value = "URBANO";
                            print("sector urbano");
                          } else {
                            sector = "RURAL";
                            gtxSimpController.sector.value = "RURAL";
                            print("sector rural");
                          }
                        }))),

            TextButton(
                onPressed: () {
                  if (gtxSimpController.parroquia.value ==
                      "Ingrese parroquia") {
                    camposVacios(context);
                  } else {
                    gtxSimpController.realizoConfiguracion.value = true;
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  width: double.infinity,
                  color: Color(0xFFF97950),
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Guardar",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
