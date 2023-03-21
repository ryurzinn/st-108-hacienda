
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/controllers/open_port_udp_controller.dart';
import 'package:st108/utils/variables.dart';


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
						const SizedBox(height: 8,),
						Container(
							height: 140,
							width: 140,
							decoration: BoxDecoration(
								color: controller.estable == '1' ? Color.fromARGB(255, 144, 247, 166) : Colors.white,
								borderRadius: BorderRadius.circular(100)
							),
							child: DashedCircularProgressBar.aspectRatio( 
								aspectRatio: 2, // width ÷ height       
								valueNotifier: value, 
								progress: double.parse(controller.peso.string),      
								maxProgress: controller.maximo.toDouble(),
								corners: StrokeCap.butt,
								foregroundColor: Color.fromRGBO(91, 163, 230, 1),
								backgroundColor: const Color.fromARGB(255, 211, 215, 216),
								foregroundStrokeWidth: 18,
								backgroundStrokeWidth: 18,
								animation: true,
								child: Center(
									child: ValueListenableBuilder(
										valueListenable: value,
										builder: (_, double value, __){
										return
											Text(
											'${value.toInt()}',
											style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w600),											
											);
										} 
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


