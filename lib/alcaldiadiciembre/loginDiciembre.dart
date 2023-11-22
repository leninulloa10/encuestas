import 'package:app_encuestas/alcaldiadiciembre/menu.dart';
import 'package:app_encuestas/alcaldiadiciembre/services/loginservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginDiciembre extends StatefulWidget {
  const loginDiciembre({super.key});

  @override
  State<loginDiciembre> createState() => _loginDiciembreState();
}

class _loginDiciembreState extends State<loginDiciembre> {
  loginserviceDiciembre gtxlogindiciembre = Get.put(loginserviceDiciembre());
  var txtuser = TextEditingController();
  var txtpwd = TextEditingController();
  var _obscureText=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Obx(() => gtxlogindiciembre.esperar.value==true?Container(child: Center(child: 
        CircularProgressIndicator(),),):
        Container(
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
          color: Colors.transparent,
          width: 150,
          height: 150,
          child: Image(
              image: AssetImage(
                "assets/images/gad/login.png",
              ),
              fit: BoxFit.fill),
        ),
        Container(
          color: Colors.white38,
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: TextField(
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
              controller: txtuser),
        ),
        Container(
          color: Colors.white38,
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: TextField(
            
            obscureText: _obscureText,
              decoration: InputDecoration(
                
                
                labelText: 'Contraseña',
                border: OutlineInputBorder(),



                 suffixIcon: 
                 GestureDetector(
                  onTap: (){

                    print("changue value");
                    if(_obscureText==true){
                      setState(() {
                        _obscureText=false;
                      });
                    }else{
                      setState(() {
                          _obscureText=true;
                      });
                    }
                  },
                  child:
                  Container(
                    child: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                  ),
                
              )),
              controller: txtpwd),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: () async {
              gtxlogindiciembre.esperar.value = true;
              gtxlogindiciembre.user.value = txtuser.text;
              gtxlogindiciembre.password.value = txtpwd.text;

              if (gtxlogindiciembre.user.value == "" ||
                  gtxlogindiciembre.password.value == "") {
                gtxlogindiciembre.esperar.value = false;

                showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error',textAlign: TextAlign.center,),
                                content: Text(
                                    'LLene todos los campos.',textAlign: TextAlign.center,),
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
              } else {
                var r = await gtxlogindiciembre.login();
                print("r====>" + r.toString());
                if (r >= 200 && r < 300) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => menuPrincipalDiciembre()),
                  );
                  gtxlogindiciembre.esperar.value = false;
                } else {
                 showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error',textAlign: TextAlign.center,),
                                content: Text(
                                    'Datos incorrectos',textAlign: TextAlign.center,),
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
                  gtxlogindiciembre.esperar.value = false;
                }
                gtxlogindiciembre.esperar.value = false;
              }
            },
            child: Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  "Ingresar",
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
    )));
  }
}
