import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:st108/utils/utils.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    Key? key,
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
                  // Share.share('com.example.st108');
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
                  dialogMaximo(context);
                },
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
