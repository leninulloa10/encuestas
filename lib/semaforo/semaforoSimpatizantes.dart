import 'dart:convert';

import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:app_encuestas/login/services/login_services.dart';
import 'package:app_encuestas/simpatizantes/services/simps_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class semaforosimpatizantesService extends GetxController {
  var goal = 0.obs; //metas
  var total = 0.obs; //total subidas

  var totalLS = 0.obs; //total LS

  var encuestasRealizadas = 0.obs;
  var rojo = 0.obs;
  var amarillo = 0.obs;
  var verde = 0.obs;

  semaforosimpatizantesService();
  enviroment gtxEnviroment = Get.put(enviroment());
  loginService gtxlogin = Get.put(loginService());
  SimpatoizanteServices gtxsimpatizantesservices =
      Get.put(SimpatoizanteServices());

  Future<dynamic> getEncuestasNumberNumber() async {
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/followers/report/daily');

      var response = await http.get(headers: {
        'authorization': 'Bearer ' + gtxlogin.token.value,
      }, url);
      print("---total simpatizantes-----");
      print(response.body);
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      goal.value = jsonData["goal"];
      total.value = jsonData["total"];
      totalLS.value = await gtxsimpatizantesservices.getNumberEncuestas();

      encuestasRealizadas.value = total.value + totalLS.value;
      print("guardado en el local storage");
      print(totalLS.toString());
      print("total encuestas realizadas");
      print(encuestasRealizadas.value.toString());
      var amari = goal.value ~/ 2;
      amarillo.value = amari;
      print("amarillo es ");
      print(amarillo.value.toString());
      print("rojoooooooo");
      var roj = goal.value ~/ 3;
      rojo.value = roj;
      print(roj);
      verde.value = goal.value;

      return response.statusCode;
    } catch (err) {
      print("saliuo del try");
      print(err);
    }
  }
}
