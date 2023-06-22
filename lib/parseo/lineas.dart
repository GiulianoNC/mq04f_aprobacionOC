import 'dart:convert';

DatosProductos datosProductosFromJson(String str) => DatosProductos.fromJson(json.decode(str));



class DatosProductos {
  DatosProductos({
    this.mq0401CDatareq,
  });

  Mq0401CDatareq? mq0401CDatareq;

  factory DatosProductos.fromJson(Map<String, dynamic> json) => DatosProductos(
    mq0401CDatareq: json["MQ0401C_DATAREQ"] == null ? null : Mq0401CDatareq.fromJson(json["MQ0401C_DATAREQ"]),
  );


}

class Mq0401CDatareq {
  late String? tableId;
  late List<Rowset>? rowset;
  late int? records;
  late bool? moreRecords;


  Mq0401CDatareq(tableId, rowset,records,moreRecords ){
    this.tableId=tableId;
    this.rowset= rowset;
    this.records = records;
    this.moreRecords = moreRecords;
  }

  Mq0401CDatareq.fromJson(Map<String, dynamic> json) {
    tableId = json["tableId"];
    rowset = json["rowset"] == null ? [] : List<Rowset>.from(json["rowset"]!.map((x) => Rowset.fromJson(x)));
    records = json["records"];
    moreRecords = json["moreRecords"];
  }


}

class Rowset {

  late String ordenLinea;
  late String fechaSolicitud;
  late String fechaOrden;
  late String fechaPrometida;
  late String desc1;
  late String desc2;
  late String um;
  late String cantidad;
  late var costoUnitDom;
  late var costoTotalDom;
  late String umsec;
  late String monedaTran;
  late var costoUnitFor;
  late var costoTotalFor;

  Rowset(ordenLinea,fechaSolicitud, fechaOrden, fechaPrometida, desc1,desc2, um, cantidad,costoUnitDom,
      costoTotalDom, umsec, monedaTran, costoUnitFor,costoTotalFor )
  {
    this.ordenLinea = ordenLinea;
    this.fechaSolicitud = fechaSolicitud;
    this.fechaOrden = fechaOrden;
    this.fechaPrometida = fechaPrometida;
    this.desc1 = desc1;
    this.desc2 = desc2;
    this.um = um;
    this.cantidad = cantidad;
    this.costoUnitDom = costoUnitDom;
    this.costoTotalDom = costoTotalDom;
    this.umsec = umsec;
    this.monedaTran = monedaTran;
    this.costoUnitFor = costoUnitFor;
    this.costoTotalFor = costoTotalDom;
  }

  Rowset.fromJson(Map<String, dynamic> json) {
    ordenLinea = json["ORDEN_LINEA"];
    fechaSolicitud = json["FECHA_SOLICITUD"];
    fechaOrden= json["FECHA_ORDEN"];
    fechaPrometida= json["FECHA_PROMETIDA"];
    desc1= json["DESC1"];
    desc2= json["DESC2"];
    um= json["UM"];
    cantidad= json["CANTIDAD"];
    costoUnitDom= json["COSTO_UNIT_DOM"];
    costoTotalDom= json["COSTO_TOTAL_DOM"];
    umsec= json["UMSEC"];
    monedaTran= json["MONEDA_TRAN"];
    costoUnitFor= json["COSTO_UNIT_FOR"];
    costoTotalFor= json["COSTO_TOTAL_FOR"];
  }


}
