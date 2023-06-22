import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../herramientas/variables_globales.dart';
import '../parseo/body.dart';


const String baseUrl = 'http://qcsys.servehttp.com:925';

class BaseClient {

  var client = http.Client();

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      "Authorization" : autorizacionGlobal,
      'Content-Type': 'application/json',
    };

    var response = await http.post(url, body: _payload, headers: _headers);
    respuesta =response.body.toString();

    List <Mq0401PFormreq1> list = [];

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      int numero = 0;
      for ( var item in jsonData["MQ0401P_FORMREQ_1"]){

        list.add(

          Mq0401PFormreq1(item["ORDEN_NRO"],item["ORDEN_TIPO"],item["ORDEN_CIA"],item["INICIADOR_NOMBRE"],
              item["PROVEEDOR_COD"],item["PROVEEDOR_DESC"],item["COSTO_TOTAL_DOM"],item["MONEDA_TRAN"],item["COSTO_TOTAL_FOR"]
              ,item["FECHA_ORDEN"]),);

        datos = (jsonData["MQ0401P_FORMREQ_1"] [numero]  ["ORDEN_NRO"]).toString();
        lista.add(datos + "\n");

        numero ++;
        datos = "";
        item = "";
      }
      return list;

    } else {
      debugPrint("error");
      //throw exception and catch it in UI
    }
  }
}