import 'dart:convert';
import 'global.dart' as global;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;
import 'package:flutter/widgets.dart';


import '../herramientas/variables_globales.dart';
import 'auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  String login = '';
  String password = '';
  String direccion = '';
  String moneda = '';


  String value ="";
  String value2 ="";
  String value3 ="";
  String value4 ="";


  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();


  Icon icon = Icon (Icons.visibility);
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondogris_solo.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.center,
                child: Image.asset("images/logo.png"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      //URL
                        child: TextField(
                          controller: myController2,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'url',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            direccion = value;
                            global.direc = value;
                          },
                        )
                    ),
                    SizedBox(
                      //distancia entre textos
                      width: 5,
                    ),
                    Expanded(
                      //MONEDA
                        child: TextField(
                          controller: myController4,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'moneda',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            moneda = value;
                            global.moneda = value;
                          },
                        )
                    )
                  ],
                ),
              ),
           /*   Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  controller: myController2,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'url',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    direccion = value;
                    global.direc = value;
                  },
                ),
              ),*/
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  controller: myController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'login',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    login = value;
                    global.user = value;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric
                  (
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  obscureText: obscure,
                  controller: myController3,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration:  InputDecoration(
                    suffixIcon: IconButton (
                        onPressed: () {
                          setState ( () {
                            if (obscure == true) {
                              obscure = false;
                              icon = Icon (Icons.visibility_off);
                            } else {
                              obscure = true;
                              icon = Icon (Icons.visibility);
                            }
                          });
                        },
                        icon: icon
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                    global.pass = value;
                  },
                ),
              ),
           /*   Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Recordar',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      )
                    ]),
              ),*/
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child :ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: Color.fromRGBO(102, 45, 145, 100),
                  textStyle: const TextStyle(fontSize: 15.0),
                ),
                onPressed: ()async{
                  value=login;
                  value2=direccion;
                  value3=password;
                  value4=moneda;


                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("TestString_key", value);
                  prefs.setString("TestString_key2", value2);
                  prefs.setString("TestString_key3", value3);
                  prefs.setString("TestString_key4", value4);


                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 20.0,
                  ),
                  child: Text('recordar'),

                ),
              ),),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
              //    backgroundColor: Color.fromRGBO(102, 45, 145, 100),
                  padding: const EdgeInsets.all(0.0),
                  elevation: 5,
                  textStyle: const TextStyle(fontSize: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onPressed: () async {
                  //yo
                    var baseUrl = direccion;
                    late String api = "/jderest/v3/orchestrator/MQ0401P_ORCH";
                    //   Future<dynamic> post(String api, dynamic object) async {
                    var url = Uri.parse(baseUrl + api);
                    //var _payload = json.encode(object);

                    //transformo el usuario y contraseña en base 64
                    autorizacionGlobal = 'Basic '+base64Encode(utf8.encode('$login:$password'));
                    print(autorizacionGlobal);

                    var _headers = {
                      "Authorization" : autorizacionGlobal,
                      'Content-Type': 'application/json',
                    };

                    var response = await http.post(url, headers: _headers);
                    print("este es el status " + response.statusCode.toString());
                    if (response.statusCode == 200) {

                      guardar_datos("login","password","direccion","moneda");

                      Navigator.pushNamed(context, "/congrats");

                      print("este es el status " + response.statusCode.toString());


                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Inicio de sesión o contraseña incorrectos'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context, 'Vuelve a intentarlo'),
                            child: const Text('Inténtalo de nuevo'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child:Ink(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromRGBO(102, 45, 145, 50), Color.fromRGBO(212, 20, 90, 50)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.all(10),
                     // constraints: const BoxConstraints(minWidth: 10.0),
                      child: Text (  "   INGRESAR                     ", textAlign: TextAlign.center),
                    )
                )
               /* child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 50.0,
                  ),

                  child: Text('INGRESAR'),
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> guardar_datos(login, password, direccion, moneda)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   await  prefs.setString("value", login);
    await  prefs.setString("value2", password);
    await prefs.setString("value3", direccion);
    await prefs.setString("value4", moneda);

  }
  @override
  void initState() {
    super.initState();
    _cargarPreferencias();

  }

  Future<void> _cargarPreferencias() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    value = prefs.getString("TestString_key")!;
    value2 = prefs.getString("TestString_key2")!;
    value3 = prefs.getString("TestString_key3")!;
    value4 = prefs.getString("TestString_key4")!;


    myController.text = value;
    myController2.text = value2;
    myController3.text = value3;
    myController4.text = value4;



  }
}