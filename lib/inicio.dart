import 'package:flutter/material.dart';

import 'herramientas/configuracion.dart';
import 'main.dart';
import 'ordenes/primera_pagina.dart';
import 'ordenes/segunda_pagina.dart';

//esta clase es para reciclar codigo, en particular lo que hace es crear como unos rutas de navegacion, al llamarlas, hacen una accion especficoa
void main() {
  runApp(MaterialApp(
    routes: {
      "/login" : (context) => MyLoginApp(),
      "/perfil": (context) =>  Aprobacion(),
      "/bienvenida" : (context) =>  Primera(),
      "/configuracion" : (context) =>  configuracion(),

    },
    initialRoute: "/login",
  ));
}