import 'package:flutter/material.dart';
import 'package:mq04f/herramientas/variables_globales.dart';
import 'package:shared_preferences/shared_preferences.dart';

final direccion = TextEditingController();


class configuracion extends StatefulWidget {
  const configuracion({Key? key}) : super(key: key);

  @override
  _configuracionState createState() => _configuracionState();
}

class _configuracionState extends State<configuracion> {

  Future <void >mostrar_datos()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      direccion.text = ( prefs.getString("direccion"))!;
    });

  }
  @override
  void initState() {
    super.initState();
    mostrar_datos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ListView(
        children: [
          //aca pongo el imagen cabecera e n este container
          Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            alignment: Alignment.center,
            child: Image.asset("assets/images/logo.png"),
          ),
          //aca pongo el ussuario
          Container(
            padding: EdgeInsets.all(15),
            child:  TextField(
              //ahora conecto con lo que quiero poner
              controller : direccion,
              decoration: InputDecoration(
                  hintText: "URL"
              ),
            ),
          ),
          //aca la conraseña
          //aca el boton
          Container(
            padding: EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text(
                  "SAVE",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "bold"
                  )
              ),
              onPressed: () async {
                //toma lo que agregaste y lo coloca en los strings
                var  dir = direccion.text;
                urlGlobal =direccion.text;

                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setString("direccion", dir);
                if (dir != "") {
                  Navigator.pushNamed(context, "/login");
                }else{
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Error "),
                      content: SingleChildScrollView(
                        //es como un listView
                        child: ListBody(
                          children:[
                            Text ("debes completar los campos"),
                          ],
                        ),
                      ),
                      //acciones para los botones dentro del dialog alert
                      actions: [
                        ElevatedButton(
                          child: Text("aceptar"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text("cancelar"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
                }
              },
            ),
          )
        ],
      ),
      ),
    );
  }
}