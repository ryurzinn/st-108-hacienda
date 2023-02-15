
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/controllers/open_port_udp_controller.dart';


class MuestraPeso extends StatelessWidget {
   MuestraPeso({super.key});

final openUdpCtrl = Get.put(OpenPortUdpController());

 final ValueNotifier<double> value = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {

    return GetX( 
      init: openUdpCtrl,
      builder:(OpenPortUdpController controller) {

       value.value = double.parse(controller.peso.string);
      
     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const SizedBox(height: 20,),
      DashedCircularProgressBar.aspectRatio( 
      aspectRatio: 2, // width ÷ height
      valueNotifier: value,
      progress: double.parse(controller.peso.string),
      maxProgress: 8400,
      corners: StrokeCap.butt,
      foregroundColor: const Color.fromARGB(255, 1, 5, 10),
      backgroundColor: const Color.fromARGB(125, 138, 135, 137),
      foregroundStrokeWidth: 18,
      backgroundStrokeWidth: 18,
      animation: true,
      child: Center(
      child: ValueListenableBuilder(
      valueListenable: value,
      builder: (_, double value, __) => Text(
      '${value.toInt()}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), 
      selectionColor: Colors.green,
      ),
    ),
  ),
),
          ],
        );
      },
    );
  }
}


