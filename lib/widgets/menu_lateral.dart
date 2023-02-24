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
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(2)
          ),
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
             title: const Text('Ver Pesadas', style: TextStyle( fontWeight: FontWeight.w500,),),
             iconColor: Colors.black,
             visualDensity: VisualDensity.comfortable,
             onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'pesadas');
             },
           ),

           const SizedBox(height: 3,),

           ListTile(
             leading: const Icon(Icons.import_export),
             title: const Text('Exportar', style: TextStyle( fontWeight: FontWeight.w500),),
             iconColor: Colors.black,
             visualDensity: VisualDensity.comfortable,
             onTap: () {
              Navigator.pushNamed(context, 'exportar');
             },
           ),

           const SizedBox(height: 3,),

           ListTile(
             leading: const Icon(Icons.build_sharp),
             title: const Text('Configurar Máximo', style: TextStyle( fontWeight: FontWeight.w500),),
             iconColor: Colors.black,
             visualDensity: VisualDensity.comfortable,
             onTap: () {
              Navigator.pushNamed(context, 'maximo');
             },
           ),

           ListTile(
             leading: const Icon(Icons.brightness_4_outlined),
             title: const Text('Cambiar tema', style: TextStyle( fontWeight: FontWeight.w500),),
             iconColor: Colors.black,
             visualDensity: VisualDensity.comfortable,
             onTap: () {
              // TODO: Cambiar entre modo light y modo dark con un ternario
              // El tema crearlo dentro del app_theme
             },
           ),
           
       ],
     ),
    );
  }
}