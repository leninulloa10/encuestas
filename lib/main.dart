import 'package:app_encuestas/alcaldiadiciembre/loginDiciembre.dart';
import 'package:app_encuestas/alcaldiadiciembre/menu.dart';
import 'package:app_encuestas/infoUbicacion/infoUbi.dart';
import 'package:app_encuestas/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getUbi();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    
      home:  loginDiciembre(),
    );
  }
}
Future<dynamic> getask() async {
    var location = new Location();
    var serviceEnable = await location.serviceEnabled();
    if (!serviceEnable) {
      print("trueeeee");

      var a = await location.requestService();
      print(a);
    } else {
      print("falseeee");

      var b = await location.requestService();
      print(b.toString());
    }
    return true;
  }

  Future<dynamic> getUbi() async {
    var location = new Location();
    var currentLocation = await location.getLocation();
    print("############");
    print(currentLocation.toString());
    infoUbicacion gtxubicacion=Get.put(infoUbicacion());
    gtxubicacion.latitud.value=currentLocation.latitude.toString();
    gtxubicacion.longitud.value=currentLocation.longitude.toString();
    print(gtxubicacion.latitud.value);
    print(gtxubicacion.longitud.value);
  }