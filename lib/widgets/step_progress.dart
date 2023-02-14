

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/controllers/step_progress_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgress extends StatelessWidget {


  final progressCtrl = Get.find<StepProgressController>();

  @override
  Widget build(BuildContext context) {

   
    return Obx(() => Row( 
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const SizedBox(height: 250,),
    CircularStepProgressIndicator(
        totalSteps: progressCtrl.porcentajeMaximo.toInt(),
        currentStep: progressCtrl.porcentajeActual.toInt(),
        stepSize: 15,
        selectedColor: const Color.fromARGB(255, 73, 89, 235),
        unselectedColor: Colors.grey,
        padding: 0,
        width: 170,
        height: 170,
        selectedStepSize: 15,
        roundedCap: (_, __) => true,
    ),
    ],
));
  }
}