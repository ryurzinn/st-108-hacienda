import 'package:flutter/material.dart';
import 'package:st108/providers/db_provider.dart';
import 'package:st108/widgets/menu_lateral.dart';

class PesadasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: Temporal leer la base de datos
    DBProvider.db.database;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Pesadas Page'),
      ),
      drawer: const MenuLateral(),
    ),);
  }
}

