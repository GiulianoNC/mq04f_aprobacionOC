import 'dart:convert';

import 'package:flutter/material.dart';

import '../conectividad/base_client.dart';
import '../herramientas/variables_globales.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import"dart:async";

import '../parseo/aprobado.dart';
import '../parseo/lineas.dart';

class Aprobacion extends StatefulWidget {
  const Aprobacion({Key? key}) : super(key: key);

  @override
  _AprobacionState createState() => _AprobacionState();
}

class _AprobacionState extends State<Aprobacion> {

  //para traer las lineas a pantalla (es una especie de retrofit)
  late String api = "/jderest/v3/orchestrator/MQ0401C_ORCH";
  late Future<List <Rowset>?>   _Listado;
  var client = http.Client();

  Future<List <Rowset>?> _getListado() async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode({
      "username": "sbasilico",
      "passwotd": "silvio71",
      "ORDEN_NRO":ordenGlobal,
      "ORDEN_TIPO": tipoGlobal,
      "ORDEN_CIA": ciaGlobal

    });
    var _headers = {
      "Authorization" : autorizacionGlobal,
      'Content-Type': 'application/json',
    };

    var response = await http.post(url, body: _payload, headers: _headers);
    respuesta =response.body.toString();

    List <Rowset> list = [];

    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      print (jsonData["MQ0401C_DATAREQ"]["rowset"]);

      datos =jsonData["MQ0401C_DATAREQ"]["rowset"].toString();
      for ( var item in jsonData["MQ0401C_DATAREQ"]["rowset"]){

        list.add(

          Rowset(item["ORDEN_LINEA"],item["FECHA_SOLICITUD"],item["FECHA_ORDEN"],
              item["FECHA_PROMETIDA"],item["DESC1"],item["DESC2"],item["UM"],item["CANTIDAD"],item["COSTO_UNIT_DOM"]
              ,item["COSTO_TOTAL_DOM"],item["UMSEC"],item["MONEDA_TRAN"],item["COSTO_UNIT_FOR"],item["COSTO_TOTAL_FOR"]),);
      }
      return list;

    } else {
      debugPrint("error");
    }
  }

  //para aprobar

  late String api2 = "/jderest/v3/orchestrator/MQ0401A_ORCH";
  Future<List <Aprobado>?> _getAprobado() async{
    var url = Uri.parse(baseUrl + api2);
    var _payload = json.encode({
      "username": "sbasilico",
      "passwotd": "silvio71",
      "ORDEN_NRO":ordenGlobal,
      "ORDEN_TIPO": tipoGlobal,
      "ORDEN_CIA": ciaGlobal

    });
    var _headers = {
      "Authorization" : autorizacionGlobal,
      'Content-Type': 'application/json',
    };
    var response = await http.post(url, body: _payload, headers: _headers);
    respuesta =response.body.toString();

    List <Aprobado> list = [];
    if("Aprobador".isNotEmpty ){
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (BuildContext context){

        return AlertDialog(
          title: Text("Aprobado "),
          content: SingleChildScrollView(
            child: ListBody(
              children:[
                Text ("orden: " + ordenGlobal),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("aceptar"),
              onPressed: (){
                Navigator.pushNamed(context, "/bienvenida");
              },
            ),
          ],
        );
      });
    }else{
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("error "),
          content: SingleChildScrollView(
            child: ListBody(
              children:[
                Text ("orden: " + ordenGlobal),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("aceptar"),
              onPressed: (){
                Navigator.pushNamed(context, "/bienvenida");
              },
            ),
          ],
        );
      });
    }

    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      print (jsonData);

      datos =jsonData.toString();
      for ( var item in jsonData){
        list.add(
          Aprobado(item["Aprobador"],item["Tipo orden"],item["jde__status"],),);
      }
      return list;
    } else {
      debugPrint("error");
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

    return MaterialApp(
      title: "Lista de ordenes",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Lineas"),
        ),
        body: FutureBuilder(
            future: _Listado,
            builder:(context, snapshot) {
              if (snapshot.hasData){
                return GridView.count(
                  crossAxisCount: 1,
                  children: _listaLineas( snapshot.data ),
                );
              }else if( snapshot.hasError)
                print(snapshot.error);{
              }
              return Center( child : CircularProgressIndicator(),
              );
            }
        ),
      ),
    );
  }

  List  <Widget> _listaLineas(  data){
    List<Widget> lineas = [];
    for(var linea in data!){
      lineas.add(Card(
          child: Column(
            children: [
              Text
                ( "Linea: " + linea.ordenLinea+   '\n' +
                  "Fecha Solicitada: " +   linea.fechaSolicitud +  '\n' +
                  "Fecha Orden: " +   linea.fechaOrden +  '\n' +
                  "Fecha Prometida: " +   linea.fechaPrometida +  '\n' +
                  "Descripción: " +   linea.desc1 +  '\n' +
                  "Descripción2 " +   linea.desc2 +  '\n' +
                  "Unida de medida: " +   linea.um +  '\n' +
                  "Cantidad: " +   linea.cantidad +  '\n' +
                  "Costo Unitario Dom: " +   linea.costoUnitDom.toString() +  '\n' +
                  "Costo Total Dom: " +   linea.costoTotalDom.toString() +  '\n' +
                  "umSec: " +   linea.umsec +  '\n' +
                  "Moneda : " +   linea.monedaTran +  '\n' +
                  "Costo Unitario: " +   linea.costoUnitFor.toString() +  '\n' +
                  "Costo Total: " +   linea.costoTotalFor.toString() +  '\n',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "bold")
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                ),
                onPressed: () {
                  _getAprobado();
                },
                child: Text ("APROBAR",
                ),
              ),
            ],
          )));

    }return lineas;
  }


}

