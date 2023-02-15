import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: [
         DrawerHeader(
           child: Column(
             children: [
               Expanded(
                 child: Image.asset('assets/Hook.png')),
                 const SizedBox(height: 3,),
                 const Text('Balanzas Hook SA', style: TextStyle(fontSize: 15),),
                 const SizedBox(height: 3,),
                 const Text('sistemas@balanzashook.com.ar', style: TextStyle(fontSize: 15),),
             ],
           )
           ),
           const SizedBox(height: 3,),
           ListTile(
             leading: const Icon(Icons.image),
             title: const Text('Ver Pesadas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
             onTap: () {
              Navigator.pushNamed(context, 'pesadas');
             },
           ),

           const SizedBox(height: 3,),

           ListTile(
             leading: const Icon(Icons.import_export),
             title: const Text('Exportar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
             onTap: () {
              Navigator.pushNamed(context, 'exportar');
             },
           ),

           const SizedBox(height: 3,),

           ListTile(
             leading: const Icon(Icons.build_sharp),
             title: const Text('Configurar Máximo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
             onTap: () {
              Navigator.pushNamed(context, 'maximo');
             },
           ),
           
       ],
     ),
    );
  }
}