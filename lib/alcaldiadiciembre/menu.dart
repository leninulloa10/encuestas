import 'package:app_encuestas/alcaldiadiciembre/encuestas.dart';
import 'package:app_encuestas/alcaldiadiciembre/services/encuestasService.dart';
import 'package:app_encuestas/alcaldiadiciembre/listaEncuestas.dart';
import 'package:app_encuestas/alcaldiadiciembre/models/bdDiciembre.dart';
import 'package:app_encuestas/encuesta/pages/exitoguardado2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class menuPrincipalDiciembre extends StatelessWidget {
  menuPrincipalDiciembre({super.key});
  encuestasServiceDiciembre gtxencuestaService =
      Get.put(encuestasServiceDiciembre());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(
              'assets/images/gad/fondo3.jpg'), // Ruta de la imagen
          fit: BoxFit.cover,

          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2), // Ajusta el nivel de opacidad
            BlendMode.dstATop, // Ajusta el modo de mezcla para la opacidad
          ),
          // Ajustar la imagen al tamaño del contenedor
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: () {
              print("hola");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => encuestadiciembre()),
              );
            },
            child: Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  "Realizar Encuestas",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            style: ElevatedButton.styleFrom(
              primary: Colors.white24,
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
                    color: Color.fromARGB(255, 92, 92, 92),
                    width: 2), // Establece un b
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: () async {
              gtxencuestaService.arraysql.clear();
              gtxencuestaService.arraysql.add(await BDDiciembre.getTodo());
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const listaEncuestasDiciembre()),
              );
            },
            child: Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  "Listado de Encuestas",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            style: ElevatedButton.styleFrom(
              primary: Colors.white24,
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
                    color: Color.fromARGB(255, 92, 92, 92),
                    width: 2), // Establece un b
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  "Salir",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            style: ElevatedButton.styleFrom(
              primary: Colors.white24,
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
                    color: Color.fromARGB(255, 92, 92, 92),
                    width: 2), // Establece un borde
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
