import 'dart:convert';

import 'package:app_encuestas/enviroment/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';

class loginService extends GetxController {
  var user = "".obs;
  var password = "".obs;
  var esperar = false.obs;
  var useerid = "".obs;
  var token = "".obs;
  var tokenElecciones="".obs;
  loginService();
  enviroment gtxEnviroment = Get.put(enviroment());
  Future<dynamic> login() async {
    print("**************************************************");
    print(user.value.toString());
    print(password.value.toString());
    try {
      final url = Uri.parse(gtxEnviroment.url + 'api/auth/login');
      var response = await http.post(url,
          body: ({
            'username': user.value,
            'password': password.value,
          }));
      print(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("login correcto");
        String body = utf8.decode(response.bodyBytes);
        print('body login  ========$body');
        final jsonData = jsonDecode(body);
        useerid.value = jsonData["user"]["_id"];
        token.value = jsonData["accessToken"];
        tokenElecciones.value = jsonData["accessTokenElections"];

        print(useerid.value);
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (err) {
      print("saliuo del try");
      print(err);
    }
  }
}
