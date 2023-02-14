import 'package:flutter/material.dart';

import '../widgets/menu_lateral.dart';

class ConexionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Conexion Page'),
      ),
      drawer: const MenuLateral(),
    ),);
  }
}