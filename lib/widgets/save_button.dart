import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
        const SizedBox(width: 15, height: 200,),
         MaterialButton(
          elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            color: Colors.grey,
            splashColor: Colors.black,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text('Guardar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            onPressed: (){
             Get.snackbar("Hola", "Tus cambios se guardaron exitosamente");
            },
           ),
       ],
     ),
    );
  }
}