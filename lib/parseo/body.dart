import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}

Mq0401 mq0401FromJson(String str) => Mq0401.fromJson(json.decode(str));


class Mq0401 {
  Mq0401({
    this.mq0401PFormreq1,
  });

  List<Mq0401PFormreq1>? mq0401PFormreq1;

  factory Mq0401.fromJson(Map<String, dynamic> json) => Mq0401(
    mq0401PFormreq1: json["MQ0401P_FORMREQ_1"] == null ? [] : List<Mq0401PFormreq1>.from(json["MQ0401P_FORMREQ_1"]!.map((x) => Mq0401PFormreq1.fromJson(x))),
  );

}

class Mq0401PFormreq1 {
  late String ordenNro;
  late  String ordenTipo;
  late String? ordenCia;
  late String? iniciadorNombre;
  late String? proveedorCod;
  late  String? proveedorDesc;
  late  String? costoTotalDom;
  late  String? monedaTran;
  late  int? costoTotalFor;
  late String? fechaOrden;

  Mq0401PFormreq1(ordenNro, ordenTipo,ordenCia,iniciadorNombre,proveedorCod, proveedorDesc,
      costoTotalDom,monedaTran, costoTotalFor ,fechaOrden){
    this.ordenNro = ordenNro;
    this.ordenTipo = ordenTipo;
    this.ordenCia = ordenCia;
    this.iniciadorNombre = iniciadorNombre;
    this.proveedorCod = proveedorCod;
    this.proveedorDesc = proveedorDesc;
    this.costoTotalDom = costoTotalDom;
    this.monedaTran = monedaTran;
    this.costoTotalFor = costoTotalFor;
    this.fechaOrden = fechaOrden;
  }


  Mq0401PFormreq1.fromJson(Map<String, dynamic> json){
    ordenNro = json["ORDEN_NRO"];
    ordenTipo= json["ORDEN_TIPO"];
    ordenCia= json["ORDEN_CIA"];
    iniciadorNombre= json["INICIADOR_NOMBRE"];
    proveedorCod= json["PROVEEDOR_COD"];
    proveedorDesc=json["PROVEEDOR_DESC"];
    costoTotalDom= json["COSTO_TOTAL_DOM"];
    monedaTran=json["MONEDA_TRAN"];
    costoTotalFor= json["COSTO_TOTAL_FOR"];
    fechaOrden= json["FECHA_ORDEN"];
  }
}
