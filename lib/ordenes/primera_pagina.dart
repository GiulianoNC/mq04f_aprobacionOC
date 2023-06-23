import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mq04f/parseo/global.dart' as global;

import '../herramientas/variables_globales.dart';
import '../parseo/body.dart';

 String baseUrl  = global.direc;

class Primera extends StatefulWidget {
  const Primera({Key? key}) : super(key: key);

  @override
  _PrimeraState createState() => _PrimeraState();
}

class _PrimeraState extends State<Primera> {
  late String api = "jderest/v3/orchestrator/MQ0401P_ORCH";

  late Future<List <Mq0401PFormreq1>?>   _Listado;
  var client = http.Client();


  Future<List <Mq0401PFormreq1>?> _getListado() async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode({
      "username": global.user,
      "passwotd": global.pass
    });
    var _headers = {
      "Authorization" : autorizacionGlobal,
      'Content-Type': 'application/json',
    };

    var response = await http.post(url, body: _payload, headers: _headers);
    respuesta =response.body.toString();

    List <Mq0401PFormreq1> list = [];

    if (response.statusCode == 200) {
      // String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(response.body);
      int numero = 0;
      for ( var item in jsonData["MQ0401P_FORMREQ_1"]){

        list.add(

          Mq0401PFormreq1(item["ORDEN_NRO"],item["ORDEN_TIPO"],item["ORDEN_CIA"],item["INICIADOR_NOMBRE"],
              item["PROVEEDOR_COD"],item["PROVEEDOR_DESC"],item["COSTO_TOTAL_DOM"],item["MONEDA_TRAN"],item["COSTO_TOTAL_FOR"]
              ,item["FECHA_ORDEN"]),);

        datos = (jsonData["MQ0401P_FORMREQ_1"] [numero]  ["ORDEN_NRO"]).toString();
        // print (jsonData["MQ0401P_FORMREQ_1"] [numero]  ["ORDEN_NRO"]);

        final newValue = datos.replaceAll("[", "").replaceAll("]", "");
        lista.add(datos + "\n");

        numero ++;
        datos = "";
        item = "";
      }
      return list;
      //recorre el listado
      print(jsonData["MQ0401P_FORMREQ_1"] [0] ["ORDEN_NRO"]);
    } else {
      debugPrint("error");
      //throw exception and catch it in UI
    }
  }
  @override
  void initState() {
    super.initState();
    _Listado = _getListado();
  }

  @override
  Widget build(BuildContext context) {
    // para recibir datos de la pantalla anterior opcion 2
    Map? parametros = ModalRoute.of(context)?.settings.arguments as Map?;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Ordenes"),
            backgroundColor :Colors.purple,
          ),
          body: FutureBuilder(
              future: _Listado,
              builder:(context, snapshot) {
                if (snapshot.hasData){
                  return GridView.count(
                    crossAxisCount: 2,
                    children: _listaOrdenes( snapshot.data ),
                  );
                }else if( snapshot.hasError);{
                }
                return Center( child : CircularProgressIndicator(),
                );
              }
          )
      ),
    );
  }

  List  <Widget> _listaOrdenes( data){
    List<Widget> ordenes = [];
    for  (var orden in data!){
      ordenes.add(
          Card(child : Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/perfil");
                  ordenGlobal =orden.ordenNro;
                  tipoGlobal =orden.ordenTipo;
                  ciaGlobal =orden.ordenCia;
                },
                child: Text (  orden.ordenNro,
                ),
              ),
              Text ( orden.ordenTipo + "  "+  orden.ordenCia  + " "+  '\n' +
                  orden.iniciadorNombre + " "+  orden.proveedorCod +  '\n' +
                  orden.proveedorDesc+ " "+ orden.costoTotalDom +  '\n' +
                  orden.monedaTran + "  " + orden.costoTotalFor.toString() +  '\n'  +orden.fechaOrden,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "bold"
                  )),

            ],
          )));
    }
    return ordenes;
  }
}

