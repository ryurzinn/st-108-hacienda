import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/pages/conexion_page.dart';
import 'package:st108/pages/exportar_page.dart';
import 'package:st108/pages/home_screen.dart';
import 'package:st108/pages/maximo_page.dart';
import 'package:st108/pages/pesadas_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'st108',
      home: const Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'home' :(_) => HomeScreen(),
        'pesadas' :(_) =>  PesadasPage(),
        'conexion' :(_) =>  ConexionPage(),
        'exportar' :(_) =>  ExportarPage(),
        'maximo' :(_) =>  MaximoPage(),
      },
    );
  }
}

