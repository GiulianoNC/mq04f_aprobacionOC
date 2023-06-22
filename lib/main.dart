import 'package:flutter/material.dart';
import 'package:mq04f/parseo/SplashScreen.dart';
import 'package:mq04f/parseo/login_screen.dart';
import 'package:mq04f/parseo/congrats_screen.dart';
import 'package:mq04f/parseo/SplashScreen.dart';
import 'package:mq04f/ordenes/primera_pagina.dart';
import 'ordenes/segunda_pagina.dart';


void main() {
  runApp(const MyLoginApp());
}

class MyLoginApp extends StatelessWidget {
  const MyLoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => const SplashScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/congrats': (BuildContext context) => const Primera(),
        "/perfil": (context) =>  Aprobacion(),
      },
    );
  }
}
