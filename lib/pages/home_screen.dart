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
        title: const Text('ST-108', style: TextStyle(color: Colors.black87),),
        backgroundColor: const Color.fromARGB(255, 96, 98, 100),
        shadowColor: Colors.black87,
        centerTitle: true,
      ),
     drawer: const MenuLateral(),
     body: Center(
       child: Column(
         children: [
           Center(
            child: MuestraPeso(),
           ), const SizedBox(height: 95,),
             const Center(   
          child: SaveButton(),
         ),
         ],
       ),
     ),
      backgroundColor: Colors.grey[100],
    );
  
  }
}



//  Future openPortUdp() async {

//       var receiver = await UDP.bind(Endpoint.any(port: const Port(5900)));

//       receiver.asStream().listen((datagram) {
//         var str = String.fromCharCodes(datagram!.data);
//         stdout.write(str);
//       });
//       }