import 'dart:convert';

import 'package:app_encuestas/alcaldiadiciembre/services/encuestasService.dart';
import 'package:app_encuestas/alcaldiadiciembre/models/bdDiciembre.dart';
import 'package:app_encuestas/alcaldiadiciembre/models/encuestamodels.dart';
import 'package:app_encuestas/alcaldiadiciembre/services/loginservices.dart';
import 'package:app_encuestas/conteo/showdialogs/guardado.dart';
import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:app_encuestas/infoUbicacion/infoUbi.dart';
import 'package:app_encuestas/share/showdialog/edad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class encuestadiciembre extends StatefulWidget {
  const encuestadiciembre({super.key});

  @override
  State<encuestadiciembre> createState() => _encuestadiciembreState();
}

class _encuestadiciembreState extends State<encuestadiciembre> {
  infoUbicacion gtxinfoUbi = Get.put(infoUbicacion());

  loginserviceDiciembre gtxlogindiciembre = Get.put(loginserviceDiciembre());
  enviroment gtxenviroment = Get.put(enviroment());
  var generoSelected = "Seleccionar";
  var parroquiaSelected = "Seleccionar";
  TextEditingController txtedad = TextEditingController();
  TextEditingController textfield6 = TextEditingController();
  TextEditingController textfield51 = TextEditingController();
  TextEditingController textfield52 = TextEditingController();
  TextEditingController textfield53 = TextEditingController();
  TextEditingController textfield12 = TextEditingController();
  TextEditingController textfield16 = TextEditingController();
  TextEditingController textfield17 = TextEditingController();
  TextEditingController textfield19 = TextEditingController();
  TextEditingController textfield21 = TextEditingController();
  var resp6 = "";
  var resp9 = "";
  var resp10 = "";
  var resp13 = "";
  var resp19 = "Seleccionar";
  var redes = "Seleccionar";
  var resp20 = "";

  encuestasServiceDiciembre gtxencuestaService =
      Get.put(encuestasServiceDiciembre());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 197, 194, 194),
          elevation: 0,
          centerTitle: true,
          title: Container(
            child: Text(
              "Cuestionario",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                'assets/images/gad/fondo3.jpg'), // Ruta de la imagen
            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), // Ajusta el nivel de opacidad
              BlendMode.dstATop, // Ajusta el modo de mezcla para la opacidad
            ),
            // Ajustar la imagen al tamaño del contenedor
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.warning,
                            color: Colors.yellow,
                          ),
                          title: Text('Responde correctamente las preguntas'),
                          subtitle: Text('No olvides llenar todos los campos.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  " Seleccione Género                                     ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.genero.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.genero.value = newValue.toString();
                    print(gtxencuestaService.genero.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["Masculino", "Femenino"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Seleccione Parroquia",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton(
                  hint: Container(
                      width: 150,
                      child: Text(
                        parroquiaSelected,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                  items: gtxenviroment.jsonJuntas.map((item) {
                    return DropdownMenuItem(
                      value: item['parroquia']![0]['nombre_parroquia'],
                      child: SizedBox(
                        width: 150, // ajusta el ancho según sea necesario
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            item['parroquia']![0]['nombre_parroquia']
                                .toString(),
                            textAlign: TextAlign.center,
                            //overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newVal) async {
                    print("#############newValueparroquia######");
                    print(newVal.toString());

                    gtxencuestaService.parroquia.value = newVal.toString();
                    setState(() {
                      parroquiaSelected = newVal.toString();
                    });

                    if (newVal == "" || newVal == null) {
                      print("no estan cargadas parroquias");
                    } else {
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
                          gtxencuestaService.sector.value = "URBANO";
                        });

                        print("sector urbano");
                      } else {
                        gtxencuestaService.sector.value = "RURAL";
                        print("sector rural");
                      }
                    }
                    print("el sector definido es ");
                    print(gtxencuestaService.sector.value);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "Ingrese Edad                         ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Mayor a 16...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) async {
                      if (value.length > 1) {
                        if (int.parse(value) < 16 || int.parse(value) > 100) {
                          edadIncorrecta(context);
                          txtedad.text = "";
                        } else {
                          print("edad correcta");
                        }
                      } else {
                        print("deja que ingrese");
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: txtedad,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "1.	¿Crees que el gobierno actual va en la dirección correcta para beneficiar a la población del país?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r1.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r1.value = newValue.toString();
                    print(gtxencuestaService.r1.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "2.	¿Cree usted que el municipio debe trabajar para construir relaciones más sólidas con otras ciudades?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r2.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: const SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r2.value = newValue.toString();
                    print(gtxencuestaService.r2.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "3.	¿El municipio debe ayudar a las empresas privadas a aumentar el empleo en la ciudad? ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r3.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: const SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r3.value = newValue.toString();
                    print(gtxencuestaService.r3.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "4.	¿El municipio debe aumentar los incentivos para las empresas que son socialmente responsables?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r4.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r4.value = newValue.toString();
                    print(gtxencuestaService.r4.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "5.	¿Cuál es la visión de desarrollo social integral que tiene en mente para Ambato mencione tres?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield51,
                    decoration: InputDecoration(
                      labelText: '1...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield52,
                    decoration: InputDecoration(
                      labelText: '2...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield53,
                    decoration: InputDecoration(
                      labelText: '3...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "6.	¿Con que frecuencia mira, lee o escucha noticias en los medios de comunicación? Que medios",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Diario'),
                value: 'Diario',
                groupValue: resp6,
                onChanged: (String? value) {
                  setState(() {
                    resp6 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Dos veces por semana o más'),
                value: 'Dos veces por semana o más',
                groupValue: resp6,
                onChanged: (String? value) {
                  setState(() {
                    resp6 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Menos de una vez por semana'),
                value: 'Menos de una vez por semana',
                groupValue: resp6,
                onChanged: (String? value) {
                  setState(() {
                    resp6 = value ?? '';
                  });
                },
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Text(
                    redes,
                    textAlign: TextAlign.center,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    setState(() {
                      redes = newValue!;
                    });
                    // Acción al seleccionar una opción
                  },
                  items: ["Facebook", "Whatsapp", "Tik Tok", "TV", "Radio"]
                      .map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "7.	¿Conoce el nombre de la alcaldesa?                      ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r7.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r7.value = newValue.toString();
                    print(gtxencuestaService.r7.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "8.	¿Ha solicitado alguna ayuda o ha presento una petición a la alcaldía o concejales en los últimos 6 meses?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r8.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: const SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r8.value = newValue.toString();
                    print(gtxencuestaService.r8.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "9.	¿El trabajo que realiza la alcaldesa es muy bueno, bueno o malo?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Muy Bueno'),
                value: 'Muy Bueno',
                groupValue: resp9,
                onChanged: (String? value) {
                  setState(() {
                    resp9 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Bueno'),
                value: 'Bueno',
                groupValue: resp9,
                onChanged: (String? value) {
                  setState(() {
                    resp9 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Malo'),
                value: 'Malo',
                groupValue: resp9,
                onChanged: (String? value) {
                  setState(() {
                    resp9 = value ?? '';
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "10.	¿Qué tanto está siendo representado sus necesidades o requerimientos por la alcaldía?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Alto'),
                value: 'Alto',
                groupValue: resp10,
                onChanged: (String? value) {
                  setState(() {
                    resp10 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Medio'),
                value: 'Medio',
                groupValue: resp10,
                onChanged: (String? value) {
                  setState(() {
                    resp10 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Bajo'),
                value: 'Bajo',
                groupValue: resp10,
                onChanged: (String? value) {
                  setState(() {
                    resp10 = value ?? '';
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "11.	¿La alcaldía debería explicar en que se está invirtiendo los recursos de los ciudadanos?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r11.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r11.value = newValue.toString();
                    print(gtxencuestaService.r11.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),

//desde aki marcar
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "12.	¿Qué servicios municipales utiliza más usted?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield12,
                    decoration: InputDecoration(
                      labelText: 'Ingrese...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "13.	¿Qué tan satisfecho esta con los servicios ofertados por el municipio?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Muy Satisfecho'),
                value: 'Muy Satisfecho',
                groupValue: resp13,
                onChanged: (String? value) {
                  setState(() {
                    resp13 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Satisfecho'),
                value: 'Satisfecho',
                groupValue: resp13,
                onChanged: (String? value) {
                  setState(() {
                    resp13 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Poco Satisfecho'),
                value: 'Poco Satisfecho',
                groupValue: resp13,
                onChanged: (String? value) {
                  setState(() {
                    resp13 = value ?? '';
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('totalmente insatisfecho'),
                value: 'Totalmente insatisfecho',
                groupValue: resp13,
                onChanged: (String? value) {
                  setState(() {
                    resp13 = value ?? '';
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "14.	¿Usted cree que la alcaldía esta cumpliendo con la oferta de campaña?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r14.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r14.value = newValue.toString();
                    print(gtxencuestaService.r14.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "15.	¿Ha notado algún cambio en el municipio durante este tiempo?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r15.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r15.value = newValue.toString();
                    print(gtxencuestaService.r15.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "16.	¿Puede mencionar los cambios más importantes de esta alcaldía?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield16,
                    decoration: InputDecoration(
                      labelText: 'Ingrese...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "17.	¿Puede mencionar cuales son los errores de esta administración?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield17,
                    decoration: InputDecoration(
                      labelText: 'Ingrese...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "18.	¿Usted puede asistir a la elaboración del presupuesto participativo?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Obx(() => Text(
                        gtxencuestaService.r18.value,
                        textAlign: TextAlign.center,
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    gtxencuestaService.r18.value = newValue.toString();
                    print(gtxencuestaService.r18.value);
                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "19.	¿Algún funcionario ha solicitado coima para brindar los servicios?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  hint: Text(
                    resp19,
                    textAlign: TextAlign.center,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    setState(() {
                      resp19 = newValue.toString();
                    });

                    // Acción al seleccionar una opción
                  },
                  items: ["SI", "NO"].map((String opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                ),
              ),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield19,
                    decoration: InputDecoration(
                      labelText: 'Departamento o sección...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //   child: const Text(
              //     "20.	¿Qué tan satisfecho esta con los servicios que oferta el Municipio?",
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //     textAlign: TextAlign.left,
              //   ),
              // ),
              // RadioListTile<String>(
              //   title: const Text('Satisfecho'),
              //   value: 'Muy Satisfecho',
              //   groupValue: resp20,
              //   onChanged: (String? value) {
              //     setState(() {
              //       resp20 = value ?? '';
              //     });
              //   },
              // ),
              // RadioListTile<String>(
              //   title: const Text('Satisfecho'),
              //   value: 'Satisfecho',
              //   groupValue: resp20,
              //   onChanged: (String? value) {
              //     setState(() {
              //       resp20 = value ?? '';
              //     });
              //   },
              // ),
              // RadioListTile<String>(
              //   title: const Text('Poco Satisfecho'),
              //   value: 'Poco Satisfecho',
              //   groupValue: resp20,
              //   onChanged: (String? value) {
              //     setState(() {
              //       resp20 = value ?? '';
              //     });
              //   },
              // ),
              // RadioListTile<String>(
              //   title: const Text('totalmente insatisfecho'),
              //   value: 'Totalmente insatisfecho',
              //   groupValue: resp20,
              //   onChanged: (String? value) {
              //     setState(() {
              //       resp20 = value ?? '';
              //     });
              //   },
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "20.	¿Qué cosas debe mejorar el Municipio?                         ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: textfield21,
                    decoration: InputDecoration(
                      labelText: 'Ingrese su comentario...',
                      border: OutlineInputBorder(),
                    ),
                  )),
              Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: TextButton(
                    onPressed: () async {
                      gtxencuestaService.esperar.value = true;
                      gtxencuestaService.edad.value = txtedad.text;
                      
                      var r5let = {
                        "1": textfield51.text,
                        "2": textfield52.text,
                        "3": textfield53.text
                      };
                      var r6let = {"frecuencia": resp6, "medios": redes};
                      var r19let = {
                        "resp1": resp19,
                        "departamento": textfield19.text
                      };
                      gtxencuestaService.r5.value =
                          jsonEncode(r5let).toString();
                      gtxencuestaService.r6.value =
                          jsonEncode(r6let).toString();
                      gtxencuestaService.r9.value = resp9;
                      gtxencuestaService.r10.value = resp10;
                      gtxencuestaService.r12.value = textfield12.text;
                      gtxencuestaService.r13.value = resp13;
                      gtxencuestaService.r16.value = textfield16.text;
                      gtxencuestaService.r17.value = textfield17.text;
                      gtxencuestaService.r19.value =
                          jsonEncode(r19let).toString();
                      gtxencuestaService.r20.value = resp13;
                      gtxencuestaService.r21.value = textfield21.text;
                  
                      if (gtxencuestaService.genero.value == "Seleccionar" ||
                          txtedad.text == "" ||
                          txtedad.text == "" ||
                          gtxencuestaService.parroquia.value == "Seleccionar" ||
                          gtxencuestaService.r1.value == "Seleccionar" ||
                          gtxencuestaService.r2.value == "Seleccionar" ||
                          gtxencuestaService.r3.value == "Seleccionar" ||
                          gtxencuestaService.r4.value == "Seleccionar" ||
                          textfield51.text == "" ||
                          textfield52.text == "" ||
                          textfield53.text == "" ||
                          resp6 == "" ||
                          redes == "Seleccionar" ||
                          gtxencuestaService.r7.value == "seleccionar" ||
                          gtxencuestaService.r8.value == "Seleccionar" ||
                          gtxencuestaService.r9.value == "" ||
                          gtxencuestaService.r10.value == "" ||
                          gtxencuestaService.r11.value == "Seleccionar" ||
                          gtxencuestaService.r12.value == "" ||
                          gtxencuestaService.r13.value == "" ||
                          gtxencuestaService.r14.value == "Seleccionar" ||
                          gtxencuestaService.r15.value == "Seleccionar" ||
                          gtxencuestaService.r16.value == "" ||
                          gtxencuestaService.r17.value == "" ||
                          gtxencuestaService.r18.value == "Seleccionar" ||
                          resp19 == "Seleccionar" ||
                          textfield19.text == "" ||
                          gtxencuestaService.r20.value == "" ||
                          gtxencuestaService.r21.value == "") {
                        print("ingrese todos los datos");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Error',
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  'LLene todos los campos.',
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Cierra el diálogo
                                    },
                                    child: Text('Cerrar'),
                                  ),
                                ],
                              );
                            });
                        gtxencuestaService.esperar.value = false;
                      } else {
                        if(int.parse(txtedad.text)<16){

                          edadIncorrecta(context);
                        }else{
                        var encuestaNueva =  encuestaDiciembreModel(
                            date: DateTime.now().toString(),
                            genero: gtxencuestaService.genero.value,
                            parroquia: gtxencuestaService.parroquia.value,
                            sector: gtxencuestaService.sector.value,
                            edad: gtxencuestaService.edad.value,
                            respuesta1: gtxencuestaService.r1.value,
                            respuesta2: gtxencuestaService.r2.value,
                            respuesta3: gtxencuestaService.r3.value,
                            respuesta4: gtxencuestaService.r4.value,
                            respuesta5: gtxencuestaService.r5.value,
                            respuesta6: gtxencuestaService.r6.value,
                            respuesta7: gtxencuestaService.r7.value,
                            respuesta8: gtxencuestaService.r8.value,
                            respuesta9: gtxencuestaService.r9.value,
                            respuesta10: gtxencuestaService.r10.value,
                            respuesta11: gtxencuestaService.r11.value,
                            respuesta12: gtxencuestaService.r12.value,
                            respuesta13: gtxencuestaService.r13.value,
                            respuesta14: gtxencuestaService.r14.value,
                            respuesta15: gtxencuestaService.r15.value,
                            respuesta16: gtxencuestaService.r16.value,
                            respuesta17: gtxencuestaService.r17.value,
                            respuesta18: gtxencuestaService.r18.value,
                            respuesta19: gtxencuestaService.r19.value,
                            respuesta20: gtxencuestaService.r20.value,
                            respuesta21: gtxencuestaService.r21.value,
                            latitud: gtxinfoUbi.latitud.value,
                            longitud: gtxinfoUbi.longitud.value,
                            user: gtxlogindiciembre.token.value);
                        var r = await BDDiciembre.insert(encuestaNueva);
                        print(
                            "%%%%%%%%se guardo en la base de datos%%%%%%%%%%%%%");
                        print(r.toString());
                        if (r != null || r != "") {
                          guardadoExitoSQLLITE(context);
                          gtxencuestaService.reset();
                          gtxencuestaService.esperar.value = false;
                        } else {
                          errorGuardadoSQLLITE(context);
                          gtxencuestaService.esperar.value = false;
                        }
                        gtxencuestaService.esperar.value = false;
                      }}
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Color.fromARGB(255, 9, 0, 178),
                      elevation: 1,
                      primary: const Color.fromARGB(60, 255, 255, 255),
                      shape: const RoundedRectangleBorder(
                        ///borderRadius:
                        // BorderRadius.circular(20), // Establece bordes redondeados
                        // También puedes establecer otros bordes, por ejemplo:
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        // borderRadius: BorderRadius.circular(0), // Sin bordes redondeados

                        side: BorderSide(
                            color: Color.fromARGB(255, 9, 0, 178),
                            width: 2), // Establece un borde
                      ),
                    ),
                    child: Text(
                      "Guardar",
                      style: TextStyle(
                        color: Colors.black, // Color del texto del botón
                        fontSize: 16,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
