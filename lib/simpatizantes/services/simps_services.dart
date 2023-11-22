import 'dart:convert';

import 'package:app_encuestas/infoUbicacion/infoUbi.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../enviroment/enviroment.dart';
import '../../login/services/login_services.dart';

class SimpatoizanteServices extends GetxController {
  var realizoConfiguracion = false.obs;
  var esperar = false.obs;
  var nombres = "".obs;
  var canton = "Ambato".obs;
  var sector = "".obs;
  var parroquia = "Ingrese parroquia".obs;
  var genero = "Ingrese genero".obs;
  var edad = "".obs;
  var telefono = "".obs;
  var correo = "".obs;
  var listaAux = [];
  var numeroEncuestas = 0.obs;

  infoUbicacion gtxubi = Get.put(infoUbicacion());
  enviroment gtxEnviroment = Get.put(enviroment());
  loginService gtxlogin = Get.put(loginService());
  Future<dynamic> Guardar(datafinal) async {
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/followers/many');
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

        print("bborro el");
      } else {
        print("no se pudo subir a la nube");
      }

      return response.statusCode;
    } catch (err) {
      print("saliuo del try");
      print(err);
    }
  }

  Future<void> reset() async {
    esperar.value = false;
    nombres.value = "";
    canton.value = "Ambato";

    genero.value = "Ingrese genero";
    edad.value = "";
    telefono.value = "";
    correo.value = "";
  }

  Future<dynamic> saveJsonInLocalStorage(datanueeva) async {
    print("entra a guaradr en local storage");
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('simpatizantesLS');
    print("simpatizantes guardados en el; local estorage");
    print(temp);
    var data = jsonDecode(temp.toString());
    listaAux.add(datanueeva);

    var saveData = jsonEncode(listaAux);
    await prefs.setString('simpatizantesLS', saveData);
    print("guardado en el local storage");
    return ({"status": "ok"});
  }

  borrarPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('simpatizantesLS');
    listaAux.clear();
  }

  Future<dynamic> getNumberEncuestas() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('simpatizantesLS');
    var data = jsonDecode(temp.toString());
    print("+++++++getNumberEncuestas simpatizantes ++++++++");
    print(data);
    if (data == null) {
      numeroEncuestas.value = 0;
      return numeroEncuestas.value;
    } else {
      numeroEncuestas.value = data.length;
      return numeroEncuestas.value;
    }
  }

  Future<dynamic> getLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('simpatizantesLS');
    var data = jsonDecode(temp.toString());

    print(data.toString());
    print(data.runtimeType);
    var resp = await Guardar(data);
    if (resp >= 200 && resp < 300) {
      borrarPreferences();
      return ({"status": "ok"});
    } else {
      return ({"status": "ko"});
    }
  }

  Future<dynamic> GuardarOffline() async {
    var data = <String, dynamic>{
      'lat': gtxubi.latitud.value,
      'lng': gtxubi.longitud.value,
      'fullName': nombres.value,
      'parish': "",
      'gender': genero.value,
      'age': edad.value,
      'email': correo.value,
      'phone': telefono.value,
    };

    print("dataaaaaaaaaaa");
    print(data.toString());
    var r = await saveJsonInLocalStorage(data);
    return r;
  }
}
