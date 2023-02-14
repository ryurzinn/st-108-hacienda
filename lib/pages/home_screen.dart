import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/controllers/step_progress_controller.dart';
import 'package:st108/widgets/step_progress.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/save_button.dart';

class HomeScreen extends StatelessWidget {

  final progressCtrl = Get.put(StepProgressController());
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ST-108', style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.grey[500],
        shadowColor: Colors.black87,
        centerTitle: true,
      ),
     drawer: const MenuLateral(),
     body: Center(
       child: Column(
         children: [
           Center(
            child: StepProgress(),
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
}

//  Future openPortUdp() async {

//       var receiver = await UDP.bind(Endpoint.any(port: const Port(5900)));

//       receiver.asStream().listen((datagram) {
//         var str = String.fromCharCodes(datagram!.data);
//         stdout.write(str);
//       });
//       }