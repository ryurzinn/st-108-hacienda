import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/database/db_pesada.dart';
import 'package:st108/providers/db_provider.dart';
import 'package:st108/widgets/input_pesadas.dart';

import 'package:st108/widgets/muestra_peso.dart';
import '../controllers/open_port_udp_controller.dart';
import '../widgets/menu_lateral.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final indicadorController = TextEditingController();
  final loteController = TextEditingController();
  final estadoController = TextEditingController();
  final caravanaController = TextEditingController();

  final openUdpCtrl = Get.put(OpenPortUdpController());

  final linearGradient = const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4,0.9],
              colors: [Color(0xFFa6a6a6),Color(0xFFd9d9d9),  Color.fromARGB(255, 99, 99, 99) ],
            );

  @override
  Widget build(BuildContext context) {   

    return Scaffold(
      appBar: AppBar(
        title: const Text('ST-108', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),),
        backgroundColor: const Color.fromARGB(255, 185, 185, 192),
        shadowColor: const Color.fromARGB(221, 59, 58, 58),
        centerTitle: true,
        flexibleSpace: Container(
           decoration: BoxDecoration(
            gradient: linearGradient,
          ),
        ),
      ),
     drawer: const MenuLateral(),
     body: SingleChildScrollView(
       child: Column(
         children: [
          Center(
            child: MuestraPeso(),
          ),
          const SizedBox(height: 10,),

          Form(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  InputPesadas(controller: indicadorController, 
                    fondo: const Color.fromRGBO(255, 238, 170, 0.5), 
                    linea: const Color.fromRGBO(255, 238, 0, 1), 
                    label: 'Indicador', hint: 'Indicador',  
                    helperText: 'Solo números', counterText: '6 Caracteres',
                    length: 6, icon:  Icons.ad_units,
                  ),

                  InputPesadas(
                    controller: loteController, 
                    fondo: const Color.fromRGBO(255, 189, 89, 0.4), 
                    linea: const Color.fromRGBO(255, 153, 0, 0.4), 
                    label: 'Lote',
                    hint: 'Lote', 
                    helperText: '',
                    counterText: '12 Caracteres', 
                    length: 12, 
                    icon: Icons.ad_units
                  ),
                      
                  InputPesadas(
                   controller: estadoController,
                   fondo: const Color.fromRGBO(255, 87, 87,0.2),
                   linea: const Color.fromRGBO(255, 87, 87, 0.4),
                   label: 'Estado',
                   hint: 'Estado',
                   helperText: '',
                   counterText: '4 Caracteres',
                   length: 4,
                   icon: Icons.ad_units
              ),

                      
                  InputPesadas(
                    controller: caravanaController,
                    fondo: const Color.fromRGBO(0, 128, 55, 0.3),
                    linea: const Color.fromRGBO(0, 128, 55, 0.3), 
                    label: 'Caravana',
                    hint: 'Caravana',
                    helperText: '',
                    counterText: '22 Caracteres',
                    length: 22,
                    icon: Icons.ad_units
                  )


          
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 110),
            child: const Image(
              image: AssetImage('assets/hookInicio.png'))
          ),

          const SizedBox(height: 20,),
          
          bottonGuardar(),
          const SizedBox(height: 20,),

        ],
      ),
    ),
      backgroundColor: Colors.white
    );
  }

  bottonGuardar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      decoration: BoxDecoration(
        gradient: linearGradient,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255), padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50,),
          textStyle: const TextStyle()
        ),           
        onPressed: () async{
          guardar();
        },
        child: const Text('GUARDAR', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black, ),)
      
      )
    );
  }

  void guardar() async{
    final now = DateTime.now();
    String fecha = now.day.toString() + '/' + now.month.toString() + '/' + now.year.toString();
    String hora = now.hour.toString() + ':' + now.minute.toString() + ':' + now.second.toString();

    DBpesadas dbPesadas = DBpesadas(
      fecha: fecha,
      hora: hora,
      indicador: indicadorController.text,
      lote: loteController.text,
      estado: estadoController.text,
      caravana: caravanaController.text,
      peso: openUdpCtrl.peso.toString(),
    );

    final resp = await DBProvider.db.insertPesada(dbPesadas);
    if(resp != null){
      Get.snackbar(
        'PESADA', 'Se guardo correctamente',
        backgroundColor: const Color.fromARGB(255, 65, 216, 97),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(8.0),
        isDismissible: true,
        duration: const Duration(seconds: 3),             
        icon: const Icon(Icons.error, color: Color.fromARGB(255, 0, 0, 0),),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        maxWidth: 300,               
      );
    }else{
      Get.snackbar(
        'PESADA', 'No se pudo guardar la Pesada',
        backgroundColor: const Color.fromARGB(255, 241, 28, 13),
        maxWidth: 300,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(8.0),
        isDismissible: true,
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.error, color: Color.fromARGB(255, 0, 0, 0),),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        
      );
    }
  }

}

