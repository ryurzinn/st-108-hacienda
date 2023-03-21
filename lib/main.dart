import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/pages/home_screen.dart';
import 'package:st108/pages/pesadas_page.dart';
import 'package:st108/providers/db_provider.dart';
import 'package:st108/utils/variables.dart';

import 'controllers/open_port_udp_controller.dart';

void main()async{
  final pesoCtrl = Get.put(OpenPortUdpController());
  pesoCtrl.openPortUdp();

  
  
  
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    buscarMaximo();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'st108',
      home: const Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),      initialRoute: 'home',
      routes: {
        'home' :(context) =>  HomeScreen(),
        'pesadas' :(_) =>  PesadasPage(),
        // 'exportar' :(_) =>  ExportarPage(),
       
      },
    );
  }

  buscarMaximo()async{
    final maximoCtrl =Get.put(OpenPortUdpController());
    var resp = await DBProvider.db.buscarMaximo();  
    if(resp.isNotEmpty){
      maximoCtrl.refrescarMaximo(double.parse(resp[0].maximo));
    }else{
      maximoCtrl.refrescarMaximo(1000.0);
    }
    

  }
}
   
