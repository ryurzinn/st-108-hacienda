import 'dart:async';

import 'package:st108/models/pesadas_model.dart';
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

}


