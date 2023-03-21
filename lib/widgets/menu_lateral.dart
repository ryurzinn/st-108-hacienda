import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:st108/export/export_xls.dart';
import 'package:st108/models/pesadas_model.dart';
import 'package:st108/providers/db_provider.dart';
import 'package:st108/utils/utils.dart';

class MenuLateral extends StatelessWidget {
  final BuildContext contexto; 
   const MenuLateral({
    Key? key, required this.contexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Container(
         decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 5, 50, 87), Color.fromARGB(255, 4, 37, 61), Color.fromARGB(255, 2, 44, 82)],
            begin:  Alignment.topLeft,
            end: Alignment.topRight
            )
          ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
             decoration:  const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 5, 50, 87), Color.fromARGB(255, 4, 37, 61), Color.fromARGB(255, 2, 44, 82)],
              begin:  Alignment.topLeft,
              end: Alignment.topRight
              )
            ),
                child: Column(
                  children: [
                    Expanded(child: Image.asset('assets/Hook.png')),
                    const Text(
                      'Balanzas Hook SA',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'sistemas@balanzashook.com.ar',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                )),
            const SizedBox(
              height: 5,
            ),
            Container(
                decoration:  const BoxDecoration(
                gradient: LinearGradient(
                colors: [Color.fromARGB(255, 5, 50, 87), Color.fromARGB(255, 4, 37, 61), Color.fromARGB(255, 2, 44, 82)],
                begin:  Alignment.centerLeft,
                end: Alignment.topCenter
              ),
            ),
              child: ListTile(
                leading: const Icon(Icons.remove_red_eye_outlined),
                title: const Text(
                  'Ver Pesadas',
                  style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                  ),
                ),
                iconColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'pesadas');
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
               decoration:  const BoxDecoration(
               gradient: LinearGradient(
               colors: [Color.fromARGB(255, 5, 50, 87), Color.fromARGB(255, 4, 37, 61), Color.fromARGB(255, 2, 44, 82)],
               begin:  Alignment.centerLeft,
               end: Alignment.topCenter
              )
            ),
              child: ListTile(
                leading: const Icon(Icons.import_export_sharp),
                title: const Text(
                  'Exportar',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                ),
                iconColor: Colors.white,
                onTap: () {
                   exportarPesadas();
                },            
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Container(
               decoration:  const BoxDecoration(
               gradient: LinearGradient(
               colors: [Color.fromARGB(255, 5, 50, 87), Color.fromARGB(255, 4, 37, 61), Color.fromARGB(255, 2, 44, 82)],
               begin:  Alignment.centerLeft,
               end: Alignment.topCenter
              )
            ),
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Configurar Máximo',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                ),
                iconColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                  dialogMaximo(contexto);
                },
              ),
            ),
          ],
        ),
      ),
      
    );
  }


  
  Future<String> get _localPath async {
  final directory = await DownloadsPathProvider.downloadsDirectory;
  String direccion = directory!.path;
  return direccion;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/pesadas.xls');
}
//1- Crear Libro 2- Crear hoja 3- Crear tabla 4- Encabeados de la tabla 5- Crear filas de datos 
//6- cerrar tabla 7-Cerrar hoja 8- Si no hay mas tablas para crear cerrar libro.
exportarPesadas( ) async {

  if (!await Permission.manageExternalStorage.isGranted) {

  Map<Permission, PermissionStatus> permiso = await [
    Permission.storage,
    Permission.manageExternalStorage,
    Permission.mediaLibrary,
  ].request();

  }else{
    Get.snackbar(
      'exportación',
      'No se pudo exportar correctamente',
      backgroundColor:
          Color.fromARGB(255, 228, 50, 50),
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

  final file = await _localFile;
  final resp = await DBProvider.db.getExportarPesadas();

  String archivo = XMLvariables.createBook;
  archivo += await XMLvariables.crearHoja('Pesadas');
  archivo += await XMLvariables.abrirTabla('8');
  archivo += await XMLvariables.crearEncabezado(PesadasModel.listaPesadasModel(), "Pesadas Hacienda");
  archivo += await XMLvariables.crearFilas(resp);
  archivo += XMLvariables.cerrarTabla;
  archivo += await XMLvariables.cerrarHoja('8');
  archivo += XMLvariables.cerrarLibro;

 await file.writeAsString(archivo);

  // // Escribir el archivo
  // await file.writeAsString('${XMLvariables.createBook}');
  // await file.writeAsString(XMLvariables.crearHoja('Pesadas'), mode: FileMode.append);
  // await file.writeAsString(XMLvariables.abrirTabla(8), mode: FileMode.append);
  // await file.writeAsString(XMLvariables.crearEncabezado(PesadasModel.listaPesadasModel()));
  
  // await file.writeAsString(XMLvariables.crearFilas(resp), mode: FileMode.append);

  // await file.writeAsString(XMLvariables.cerrarTabla);
  // await file.writeAsString(XMLvariables.cerrarHoja('8'));
  // await file.writeAsString(XMLvariables.cerrarLibro);

}


}

