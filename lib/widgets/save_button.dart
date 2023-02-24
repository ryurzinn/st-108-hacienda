import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:st108/database/db_pesada.dart';


class SaveButton extends StatelessWidget {
   DBpesadas ?dBpesadas;
   SaveButton({super.key});

  @override
  Widget build(BuildContext context) {

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
              textStyle: const TextStyle(fontSize: 20, )
            ),           
            onPressed: (){
              
            },
            child: const Text('GUARDAR', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black, ),)
            
            ),
          ],
        ),
      ),
    );
  }

}  

void savePesadas() async{
  
  final guardarPesadas = TextEditingController();
  

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('pesadas', guardarPesadas.text );
      
  Get.snackbar('Se guardo Correctamente', 'si sale esto es porque funciona', backgroundColor: Colors.green, snackStyle: SnackStyle.FLOATING);

  }
    


