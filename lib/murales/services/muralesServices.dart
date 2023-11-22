import 'dart:convert';
import 'dart:io';

import 'package:app_encuestas/encuesta/models/encuestamodels.dart';
import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:app_encuestas/infoUbicacion/infoUbi.dart';
import 'package:app_encuestas/login/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class muralesServices extends GetxController {
  muralesServices();
  var esperar = false.obs;
  var listaAux = [];
  var nombrescompletos = "".obs;
  var parroquia = "parroquia".obs;
  var sector = "".obs;
  var telefono = "".obs;
  var direccion = "".obs;

  var numeroEncuestas = 0.obs;

  infoUbicacion gtxubi = Get.put(infoUbicacion());
  enviroment gtxEnviroment = Get.put(enviroment());
  loginService gtxlogin = Get.put(loginService());



Future<void> reset() async{
   parroquia.value = "parroquia";
   var sector = "".obs;
}

  Future<dynamic> Guardar(datafinal) async {
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/walls/many');
      print("el token es ");
      print(gtxlogin.token.value);
      var response = await http.post(
          headers: {
            'authorization': 'Bearer ' + gtxlogin.token.value,
          },
          url,
          body: ({
            'data': jsonEncode(datafinal),
          }));

      print(response.body);
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("GUARDADO CORREXCTAMENTE");
        await borrarPreferences();

        await getNumberEncuestas();
        print("bborro el");
      } else {
        print("no se pudo subir a la nube");
      }

      return response.statusCode;
    } catch (err) {
      print("saliuo del try");
      print(err);
    }
    // String body = utf8.decode(response.bodyBytes);
    // debugPrint('BODY login  ========$body');
    // final jsonData = jsonDecode(body);
    // print(jsonData.);
  }

  Future<dynamic> saveJsonInLocalStorage(datanueeva) async {
    print("entra a guaradr en local storage");
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('muralesLocalStorage');
    var data = jsonDecode(temp.toString());
    listaAux.add(datanueeva);

    var saveData = jsonEncode(listaAux);
    await prefs.setString('muralesLocalStorage', saveData);
    print("guardado en el local storage");
    return ({"status": "ok"});
  }

  borrarPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('muralesLocalStorage');
    listaAux.clear();
  }

  Future<dynamic> getNumberEncuestas() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('muralesLocalStorage');
    var data = jsonDecode(temp.toString());
    if (data == null) {
      numeroEncuestas.value = 0;
    } else {
      numeroEncuestas.value = data.length;
    }
  }

  Future<dynamic> getLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('muralesLocalStorage');
    var data = jsonDecode(temp.toString());

    print(data.toString());
    print(data.runtimeType);
    var resp = await Guardar(data);
    if (resp >= 200 && resp < 300) {
      return ({"status": "ok"});
    } else {
      return ({"status": "ko"});
    }
  }

  Future<dynamic> GuardarOffline() async {
    var data = <String, dynamic>{
      'lat': gtxubi.latitud.value,
      'lng': gtxubi.longitud.value,
      'city': "Ambato",
      'parish': parroquia.value,
      'zone': sector.value,
      'code': "DicSemana4",
      'fullName': nombrescompletos.value,
      'phone': telefono.value,
      'address': direccion.value
    };

    // Survey data = Survey(
    //     age: int.parse(edad.value),
    //     city: "Ambato",
    //     code: "DicSemana4",
    //     gender: genero.value,
    //     lat: double.parse(gtxubi.latitud.value),
    //     lng: double.parse(gtxubi.longitud.value),
    //     parish: parroquias.value,
    //     zone: sector.value,
    //     answers: [respuesta1, respuesta2, respuesta3, respuesta4]);
    print("dataaaaaaaaaaa");
    print(data.toString());
    var r = await saveJsonInLocalStorage(data);
    return r;
  }
}
