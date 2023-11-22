import 'dart:convert';

import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:app_encuestas/login/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class conteoServices extends GetxController {
  var esperar = false.obs;
  var parroquia = "".obs;
  var sector = "".obs;
  var recinto = "".obs;

  var genero = "".obs;
  var mesa = 0.obs;
  var listarecintos = [].obs;
  var listaauxRecintos = [].obs;

  var cantidadIgnacioDavalos = 0.obs;
  var cantidadXavierVilca = 0.obs;
  var cantidadMyriamAuz = 0.obs;
  var cantidadCarlosOrtega = 0.obs;
  var cantidadFelioeBonilla = 0.obs;
  var cantidadSalomemarin = 0.obs;
  var cantidadDianaCaiza = 0.obs;
  var cantidadLuisAmoroso = 0.obs;
  var cantidadJavierAltamirano = 0.obs;

  var nulos = 0.obs;
  var blancos = 0.obs;
  var total = 0.obs;
  var photo = "".obs;
  var arrayqslite = [].obs;

  enviroment gtxEnviroment = Get.put(enviroment());
  loginService gtxlogin = Get.put(loginService());
  Future<dynamic> guardarOnline(data) async {
    try {
      final url = Uri.parse(gtxEnviroment.urlelecciones.value + 'api/results');
      var body = json.encode(data);
      print("el body a mandar es ");
      print(body);
      print(body.runtimeType);
      var response = await http.post(headers: {
        'authorization': 'Bearer ' + gtxlogin.tokenElecciones.value,
        "Content-Type": "application/json"
      }, url, body: (body));
      print("++++++++===========>");
      print(response.body);
      print(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("exito");
        return response.statusCode;
      } else {
        print("no se pudo subir a la nube");
        return response.statusCode;
      }
    } catch (err) {
      print("saliuo del try");
      print(err);
    }
  }
}
