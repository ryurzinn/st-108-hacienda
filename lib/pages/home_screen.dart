import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/database/db_pesada.dart';
import 'package:st108/providers/db_provider.dart';

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



  @override
  Widget build(BuildContext context) {   

    return Scaffold(
      appBar: AppBar(
        title: const Text('ST-108', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: const Color.fromARGB(255, 173, 173, 177),
        shadowColor: const Color.fromARGB(221, 155, 155, 155),
        centerTitle: true,
        flexibleSpace: Container(
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black12, Colors.white, Colors.grey]
            )
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  _crearInputIndicador( indicadorController ),

                  const SizedBox(height: 20,),
              
                  _crearInputLote(loteController),

                  const SizedBox(height: 20,),
                      
                  _crearInputEstado(estadoController),

                  const SizedBox(height: 20,),
                      
                  _crearInputCaravana( caravanaController ),

                  const SizedBox(height: 20,),
          
                ],
              ),
            ),
          ),
           
          bottonGuardar(),

        ],
      ),
    ),
      backgroundColor: Colors.grey[100],
    );
  }

  Center bottonGuardar() {
    return Center(  
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black12,
                  Colors.white,
                  Colors.grey
                ])
              ),
            )
            ),
            TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 90),
              textStyle: const TextStyle()
            ),           
            onPressed: () async{
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
            },
            child: const Text('GUARDAR', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black, ),)
            
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInputIndicador(TextEditingController controller) { // INDICADOR
    return TextField(
      onChanged: (value) {
        indicadorController.text = value;
      },
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 6, 
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 230, 0))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 230, 0)),
        ),
        hintText: 'Indicador',
        labelText: 'Colocar el indicador',
        floatingLabelStyle: TextStyle(color: Colors.black),
        helperText: 'Sólo números',
        counterText: '6 caracteres',
        suffixIcon: Icon(Icons.build_outlined,),
        border: OutlineInputBorder(         
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
          ),
        ),  
      ),
            
    );
  
  }
  Widget _crearInputLote(TextEditingController controller) { // LOTE
    return TextField(
    controller: loteController,
    maxLength: 12,
    autofocus: true,
    textCapitalization: TextCapitalization.words,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
      hintText: 'Lote',
      labelText: 'Colocar el Lote',
      floatingLabelStyle: TextStyle(color: Colors.black),
      counterText: '12 caracteres',
      suffixIcon: Icon(Icons.build_outlined),
      suffixIconColor: Colors.black,
      iconColor: Colors.black,
      prefixIconColor: Colors.black,
      border: OutlineInputBorder(         
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10)
        ),
      ),
      
      
    ),
    );
  }
 Widget _crearInputEstado(TextEditingController controller) { // ESTADO

    return TextField(
      controller: estadoController,
      maxLength: 4,
      autofocus: true,     
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 253, 17, 0))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 253, 17, 0)),
        ),
        hintText: 'Estado',
        labelText: 'Colocar el Estado',
        floatingLabelStyle: TextStyle(color: Colors.black),
        counterText: '4 caracteres',
        suffixIcon: Icon(Icons.build_outlined),
        suffixIconColor: Colors.black,
        iconColor: Colors.black,
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(         
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
          ),
        ),
        
        
      ),
      );
  }
  Widget _crearInputCaravana( TextEditingController controller) { // CARAVANA

    return TextField(
      controller: controller,
      maxLength: 22,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 28, 153, 3))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 28, 153, 3)),
        ),
        hintText: 'Caravana',
        labelText: 'Colocar la Caravana',
        floatingLabelStyle: TextStyle(color: Colors.black),
        counterText: '22 caracteres',
        suffixIcon: Icon(Icons.build_outlined),
        suffixIconColor: Colors.black,
        iconColor: Colors.black,
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(         
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
          ),
        ),
      ),
    );
  }



}