import 'package:flutter/material.dart';

import 'package:st108/widgets/muestra_peso.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/save_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ST-108', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: const Color.fromARGB(255, 11, 90, 155),
        shadowColor: Colors.black87,
        centerTitle: true,
      ),
     drawer: const MenuLateral(),
     body: SingleChildScrollView(
        
       child: Column(
         children: [
          Center(
            child: MuestraPeso(),
          ),

           Column(
            children: [
              _crearInputIndicador(),
              _crearInputLote(),
              _crearInputEstado(),
              _crearInputCaravana()
              ]
          ),
          const Center(   
          child: SaveButton(),
         ),
         ],
       ),
     ),
      backgroundColor: Colors.grey[100],
    );
  }
 Widget _crearInputIndicador() { // AMARILLO

  return Container(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      autocorrect: false,
      maxLength: 6,
      decoration: const InputDecoration(
        labelText: 'Indicador', labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
        hintText: 'Insertar indicador',
        
        
      ),
    ),
  );
  }
 Widget _crearInputLote() { // NARANJA

  return Container(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.name,
      maxLength: 12,
      decoration: const InputDecoration(
        
        labelText: 'Lote', labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
        hintText: 'Insertar Lote',
        
        
      ),
    ),
  );
  }
 Widget _crearInputEstado() { // ESTADO

  return Container(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      autocorrect: false,
      maxLength: 4,
      decoration: const InputDecoration(
        labelText: 'Estado', labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
      ),
    ),
  );
  }
 Widget _crearInputCaravana() { // CARAVANA

  return Container(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      autocorrect: false,
      maxLength: 22,
      decoration: const InputDecoration(
        labelText: 'Caravana', labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
        hintText: 'Insertar Caravana',
        
        
      ),
    ),
  );
  }
}


