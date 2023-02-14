import 'package:flutter/material.dart';
import 'package:st108/widgets/menu_lateral.dart';

class PesadasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Pesadas Page'),
      ),
      drawer: const MenuLateral(),
    ),);
  }
}

