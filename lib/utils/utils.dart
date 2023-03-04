import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/db_maximo.dart';
import '../providers/db_provider.dart';

  void dialogMaximo(BuildContext context){

    final maximoController = TextEditingController();

    Navigator.pop(context);
    showDialog(
      context: context,  
      builder: (_) {
        return AlertDialog( 
          backgroundColor: Colors.white,
          title: const Text(
            'Configurar Máximo',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          content: pesadasMaximo(maximoController),
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
                  Navigator.of(context).pop(false);
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

