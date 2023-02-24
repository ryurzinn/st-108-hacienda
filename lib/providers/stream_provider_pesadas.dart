import 'dart:async';

import 'package:st108/models/pesadas.dart';
import 'package:st108/providers/db_provider.dart';

class StreamProviderPesadas{

  static final StreamProviderPesadas _stPesadas = StreamProviderPesadas._internal();
  factory StreamProviderPesadas(){
    return _stPesadas;
  }

  StreamProviderPesadas._internal() {
    getPesadas();
  }

  final _pesadasStreamController = StreamController<List<PesadasModel>>.broadcast();
  Stream<List<PesadasModel>> get pesadasStream => _pesadasStreamController.stream;

  getPesadas()async{
    _pesadasStreamController.sink.add( await DBProvider.db.getPesadas());
  }

  // void dispose(){
  //   _pesadasStreamController.close();
  // }


}










// import 'package:st108/database/db_pesada.dart';
// import 'package:st108/models/pesadas.dart';
// import 'package:st108/providers/db_provider.dart';


// class StreamProviderPesadas{

//   List<PesadasModel> pesadas = [];

//   insertPesada( DBpesadas dBpesadas ) async{
//     final insertPesada = PesadasModel( 
//       caravana: 1,
//       estado: 2,
//       fecha: 3,
//       hora: 4,
//       id: 5,
//       indicador: 6,
//       lote: 7,
//       peso: 8);
//       final id = await DBProvider.db.insertPesada(dBpesadas);
//       insertPesada.id = id!;

//       pesadas.add(insertPesada);
//   }


//   cargarPesadas() async{
//     var pesadas = await DBProvider.db.getPesadas();
//     pesadas = [...pesadas];
//   }

// }







