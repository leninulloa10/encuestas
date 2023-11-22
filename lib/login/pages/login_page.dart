import 'package:app_encuestas/login/services/login_services.dart';
import 'package:app_encuestas/menu/pages/menu_page.dart';
import 'package:app_encuestas/share/showdialog/mensaje.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  loginService gtxlogin = Get.put(loginService());
  var usertxt = new TextEditingController();
  var passwordtxt = new TextEditingController();
  //CONSTANTES DE ESTILO
  final hintTextStyle = TextStyle(
    color: Colors.white54,
  );

  final labelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
var obscure=true;
  final inputBoxStyle = BoxDecoration(
    color: Color(0xFFEC513D),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => gtxlogin.esperar.value == false
          ? Scaffold(
              body: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF97950),
                            Color(0xFFED543C),
                            Color(0xFFE83B2D),
                            Color(0xFFDF191D),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //iniciar sesion
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: _inputEmail(),
                          ),
                          _inputContra(),
                          _loginBtn(context),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              child: Center(
              child: CircularProgressIndicator(),
            )),
    );
  }

  Widget _inputEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //LABEL
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Usuario',
            style: labelStyle,
          ),
        ),
        //INPUT BOX
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: inputBoxStyle,
          height: 60.0,
          child: TextField(
            controller: usertxt,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
           
              hintText: 'Ingrese su usuario',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputContra() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Contraseña',
            style: labelStyle,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: inputBoxStyle,
          height: 60.0,
          child: TextField(
            controller: passwordtxt,
            obscureText: obscure,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
             
              suffixIcon: TextButton(child:Icon(Icons.remove_red_eye_sharp,color: Colors.white,) ,onPressed: (){
                if(obscure==false){
                  setState(() {
                    obscure=true;
                  });
                }else{
                  setState(() {
                    obscure=false;
                  });
                }
              },) ,
              hintText: '   Ingrese su contraseña',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
            elevation: MaterialStateProperty.all(5)),
        child: Text(
          'Ingresar',
          style: TextStyle(
            color: Color.fromARGB(255, 216, 8, 8),
            letterSpacing: 1.2,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          gtxlogin.esperar.value = true;
          gtxlogin.user.value = usertxt.text.trim();
          gtxlogin.password.value = passwordtxt.text.trim();
          print(usertxt.text);
          print(passwordtxt.text);
          var r = await gtxlogin.login();
          print("login devuelve");
          print(r.toString());
          if (r >= 200 && r < 300) {
            gtxlogin.esperar.value = false;
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MenuPage()));
          } else {
            errorLogin(context);
            gtxlogin.esperar.value = false;
          }
          gtxlogin.esperar.value = false;
        },
      ),
    );
  }
}
