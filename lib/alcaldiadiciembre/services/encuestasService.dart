import 'dart:convert';

import 'package:app_encuestas/alcaldiadiciembre/loginDiciembre.dart';
import 'package:app_encuestas/alcaldiadiciembre/services/loginservices.dart';
import 'package:app_encuestas/encuesta/pages/exitoguardado2.dart';
import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class encuestasServiceDiciembre extends GetxController {
  var esperar = false.obs;
  var arraysql = [].obs;
  var genero = "Seleccionar".obs;
  var parroquia = "Seleccionar".obs;
  var sector = "Seleccionar".obs;
  var edad = "".obs;

  var r1 = "Seleccionar".obs;
  var r2 = "Seleccionar".obs;
  var r3 = "Seleccionar".obs;
  var r4 = "Seleccionar".obs;
  var r5 = "".obs;
  var r6 = "".obs;
  var r7 = "seleccionar".obs;
  var r8 = "Seleccionar".obs;
  var r9 = "".obs;

  var r10 = "".obs;
  var r11 = "Seleccionar".obs;
  var r12 = "".obs;
  var r13 = "".obs;
  var r14 = "Seleccionar".obs;
  var r15 = "Seleccionar".obs;
  var r16 = "".obs;
  var r17 = "".obs;
  var r18 = "Seleccionar".obs;
  var r19 = "Seleccionar".obs;
  var r20 = "".obs;
  var r21 = "".obs;
  encuestasServiceDiciembre();
  enviroment gtxEnviroment = Get.put(enviroment());
  loginserviceDiciembre gtxlogindiciembre = Get.put(loginserviceDiciembre());

  reset() {
    genero.value = "Seleccionar";
    parroquia.value = "Seleccionar";
    sector.value = "Seleccionar";
    edad.value = "";
    r1.value = "Seleccionar";
    r2.value = "Seleccionar";
    r3.value = "Seleccionar";
    r4.value = "Seleccionar";
    r5.value = "";
    r6.value = "";
    r7.value = "seleccionar";
    r8.value = "Seleccionar";
    r9.value = "";

    r10.value = "";
    r11.value = "Seleccionar";
    r12.value = "";
    r13.value = "";
    r14.value = "Seleccionar";
    r15.value = "Seleccionar";
    r16.value = "";
    r17.value = "";
    r18.value = "Seleccionar";
    r19.value = "Seleccionar";
    r20.value = "";
    r21.value = "";
  }

  Future<dynamic> GuardarTodo() async {
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/answers/many');
      print("el token es ");

      print(gtxlogindiciembre.token.value);
      print("el userid");
      print(gtxlogindiciembre.userid.value);
      print("el array que mando a guardar es: ");
      print(arraysql[0].toString());
      var response = await http.post(
          headers: {
            'authorization': 'Bearer ' + gtxlogindiciembre.token.value,
          },
          url,
          body: ({
            'data': jsonEncode(arraysql[0]),
            "userid": gtxlogindiciembre.userid.value,
          }));

      print(response.body);
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("GUARDADO CORREXCTAMENTE");
        // await borrarPreferences();

        // await getNumberEncuestas();

        return response.statusCode;
      } else {
        print("no se pudo subir a la nube");
        return response.statusCode;
      }
    } catch (err) {
      print("saliuo del try");
      print(err);
    }
    // String body = utf8.decode(response.bodyBytes);
    // debugPrint('BODY login  ========$body');
    // final jsonData = jsonDecode(body);
    // print(jsonData.);
  }
}
