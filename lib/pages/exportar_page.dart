import 'package:flutter/material.dart';

import '../widgets/menu_lateral.dart';

class ExportarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Exportar Page'),
      ),
      drawer: MenuLateral(contexto: context,),
    ),);
  }
}