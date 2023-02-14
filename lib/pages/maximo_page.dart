import 'package:flutter/material.dart';

import '../widgets/menu_lateral.dart';

class MaximoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Maximo Page'),
      ),
      drawer: const MenuLateral(),
    ),);
  }
}