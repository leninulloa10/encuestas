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

class encuestaService extends GetxController {
  encuestaService();
  var encuestasSubidasApi=0.obs;
  var aparecepregunta2 = true.obs;
  var numeroEncuestasLS = 0.obs;
  var esperar = false.obs;

  var canton = "Ambato".obs;
  var parroquias = "".obs;
  var sector = "".obs;
  var edad = "".obs;
  var genero = "".obs;
  var listaAux = [].obs;
  var listaAuxRes2 = [].obs;
  var respuesta1 = "".obs;
  var respuesta2 = "".obs;

  infoUbicacion gtxubi = Get.put(infoUbicacion());
  enviroment gtxEnviroment = Get.put(enviroment());
  loginService gtxlogin = Get.put(loginService());

  resetValores() async {
    aparecepregunta2.value = true;

    numeroEncuestasLS.value = 0;
    esperar.value = false;

    canton.value = "Ambato";
    parroquias.value = "";
    sector.value = "";
    edad.value = "";
    genero.value = "";
    listaAuxRes2.value = [];
    respuesta1.value = "";
    respuesta2.value = "";
  }

  Future<dynamic> Guardar(datafinal) async {
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/surveys/many');
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
        // respuesta1.clear();
        // respuesta2.clear();
        await getNumberEncuestas();
        print("bborro el");
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

  Future<dynamic> saveJsonInLocalStorage(datanueeva) async {
    print("##local storage##");
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('encuesta2enero');
    var data = jsonDecode(temp.toString());
    listaAux.add(datanueeva);

    var saveData = jsonEncode(listaAux);
    await prefs.setString('encuesta2enero', saveData);
    print("guardado en el local storage");
    return ({"status": "ok"});
  }

  borrarPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('encuesta2enero');
    listaAux.clear();
  }

  Future<dynamic> getNumberEncuestas() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('encuesta2enero');
    var data = jsonDecode(temp.toString());
    if (data == null) {
      numeroEncuestasLS.value = 0;
    } else {
      numeroEncuestasLS.value = data.length;
    }
  }

  Future<dynamic> getLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('encuesta2enero');
    var data = jsonDecode(temp.toString());
    print("@#@#@#@#@#@@@#@@#@@@#@#@#@#@#@#@#@#");
    print(data.toString());
    print(data.runtimeType);
   
   var resp = await Guardar(data);
    if (resp >= 200 && resp < 300) {
      return resp;
    } else {
      return resp;
    }
    
  
  }

  Future<dynamic> GuardarOffline() async {
    var data = <String, dynamic>{
      'lat': gtxubi.latitud.value,
      'lng': gtxubi.longitud.value,
      'city': "Ambato",
      'code': "EneroEncuesta2",
      'parish': parroquias.value,
      'age': edad.value,
      'gender': genero.value,
      'zone': sector.value,
      'question1': respuesta1.value.toString(),
      'question2': listaAuxRes2.toString(),
    };

    var r = await saveJsonInLocalStorage(data);
    return r;
  }
  Future<dynamic> getNumberEncuestasAPI() async {
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/surveys/count/by-user/ENEROENCUESTA2');
     
      var response = await http.get(
          headers: {
            'authorization': 'Bearer ' + gtxlogin.token.value,
          },
          url,
          );

      print(response.body);
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String body = utf8.decode(response.bodyBytes);
    debugPrint('geeeeetttttttttttttt###  ========$body');
    final jsonData = jsonDecode(body);
    encuestasSubidasApi.value=jsonData;
    print(encuestasSubidasApi.value);
       
      } else {
       
      }

      return response.statusCode;
    } catch (err) {
      print("saliuo del try contar");
      print(err);
    }
}
}