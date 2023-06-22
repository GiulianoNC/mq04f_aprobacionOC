import 'dart:convert';

Aprobado aprobadoFromJson(String str) => Aprobado.fromJson(json.decode(str));

class Aprobado {
  String? aprobador;
  String? tipoOrden;
  String? jdeStatus;

  Aprobado(aprobador, tipoOrden, jdeStatus){
    this.aprobador =aprobador;
    this.tipoOrden = tipoOrden;
    this.jdeStatus=jdeStatus;
  }

   Aprobado.fromJson(Map<String, dynamic> json) {
     aprobador = json["Aprobador"];
     tipoOrden= json["Tipo orden"];
     jdeStatus=  json["jde__status"];
   }

}
