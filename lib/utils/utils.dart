import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st108/utils/variables.dart';
import 'package:st108/widgets/input_pesadas.dart';

import '../database/db_maximo.dart';
import '../providers/db_provider.dart';

  void dialogMaximo(BuildContext context){

    final maximoController = TextEditingController();


    showDialog(
      context: context,  
      builder: (_) {
        return AlertDialog( 
          backgroundColor: Colors.grey,
          title: const Text(
            'Configurar Máximo',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          content: Container(
            height: 100,
            child: InputPesadas(controller: maximoController, 
            hintColor: const Color.fromARGB(255, 94, 93, 93),
            fondo: Colors.grey, linea: const Color.fromARGB(255, 83, 83, 83), 
            label: 'Máximo', hint: '8400..', 
            helperText: 'Peso máximo', 
            counterText: '5 números', 
            length: 5, icon: Icons.numbers_outlined
            ),
          ),
         
          actions: [
            TextButton(
              onPressed: () async {           
                DBPesadasMaximo pesadasMaximo = DBPesadasMaximo(id: '1',maximo: maximoController.text);
                var resp = await DBProvider.db.actualizarMaximo(pesadasMaximo);
                if(resp == 0){
                   final insert = await DBProvider.db.insertarMaximo(pesadasMaximo);
                   insert == 1 ? resp = 1 : resp = null; 
                }
                if (resp != 0) {
                 Variables.maximo = double.tryParse(maximoController.text)!;
                  Navigator.pop(context);
                  Get.snackbar(
                    'Máximo',
                    'Configuracion guardada correctamente',
                    backgroundColor:
                        const Color.fromARGB(255, 65, 216, 97),
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(8.0),
                    isDismissible: true,
                    duration: const Duration(seconds: 3),
                    icon: const Icon(
                      Icons.error,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    maxWidth: 300,
                  );
                }
              },
              child: const Text(
                'Actualizar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
            ),
            const SizedBox(width: 80,),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                )),
          ],
        );
      },
    );

  }

  TextField pesadasMaximo(TextEditingController controller) {
    return TextField(
      onChanged: (value) { 
      },
      controller: controller,
      cursorColor: Colors.black,
      maxLength: 4,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Ej: 3210..',
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

