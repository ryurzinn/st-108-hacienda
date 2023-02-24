import 'package:flutter/material.dart';

import '../models/pesadas.dart';
import '../providers/stream_provider_pesadas.dart';


class PesadasPage extends StatelessWidget {
   PesadasPage({super.key});

  final pesadasProvider =  StreamProviderPesadas();
  final estiloFilaSuperior = const TextStyle(fontSize: 12, fontStyle: FontStyle.normal);
  final estiloFilaSuperiorData = const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600);
  

  @override
  Widget build(BuildContext context) {

    pesadasProvider.getPesadas();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesadas',style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25),),
        shadowColor: Colors.grey,
        centerTitle: true,
        flexibleSpace: Container(
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.white, Colors.white, Colors.grey, Colors.grey, ]
            )
          ),
        ),
      ),
      body: StreamBuilder(
        stream: pesadasProvider.pesadasStream,
        builder: (BuildContext context, AsyncSnapshot<List<PesadasModel>> snapshot) {

        if(!snapshot.hasData){
          return const CircularProgressIndicator();
        }

        final lista = snapshot.data;
      
         return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: lista!.length,
          itemBuilder: (context, index) {    
            return Dismissible(        
              key: Key(context.toString()),
              direction: DismissDirection .startToEnd,
              background: Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                color: Colors.red[400],
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete, color: Colors.white,)),
              ),

              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      insetPadding: const EdgeInsets.all(60),
                      title: const Text('Eliminar la Pesada'),
                      content: const Text('¿Seguro que desea eliminar la Pesada?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('No'),    
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop(true);
                          }, 
                          child: const Text('Si, deseo eliminar la pesada')
                        ),
                      ],
                
                    );
                  },
                );
              },
              
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                shadowColor: const Color.fromARGB(255, 196, 195, 195),
                elevation: 10,
                child: Column(
                  children: [
                    Container( 
                      padding: const EdgeInsets.symmetric(vertical: 3),              
                      color: const Color.fromARGB(255, 218, 217, 217),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(children: [Text('Id: ',style: estiloFilaSuperior), Text('${lista[index].id}', style:estiloFilaSuperiorData)],),
                          Row(children: [Text('Fecha : ', style: estiloFilaSuperior), Text(lista[index].fecha, style: estiloFilaSuperiorData,)],),
                          Row(children: [Text('Hora : ', style: estiloFilaSuperior), Text(lista[index].fecha, style: estiloFilaSuperiorData,)],),
                        ],
                      ),
                    ),
                        

                    const SizedBox(height: 5,),
                
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,                   
                        children: [
                         
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Indicador: ${lista[index].indicador}   ', style: const TextStyle(fontSize: 12),), 
                              Text('Lote: ${lista[index].lote}   ', style: const TextStyle(fontSize: 12)),
                            ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Estado: ${lista[index].estado}   ' , style: const TextStyle(fontSize: 12)),
                                Text('Caravana: ${lista[index].caravana}', style: const TextStyle(fontSize: 12)), 
                              ],
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Peso: ${lista[index].peso}',   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            ],
                          )
                             
                        ],
                      ),
                    ),  
                  ],
                ),
              ),
            );
            },
          );
        }
      )
    );
  }
}
                
            
      

  Future<bool?> mostrarAlerta(BuildContext context) {
    return showDialog(
              context: context,
              builder: (_) {
              return AlertDialog(
              insetPadding: const EdgeInsets.all(60),
              title: const Text('Eliminar la Pesada'),
              content: const Text('¿Seguro que desea eliminar la Pesada?'),
              actions: [
                TextButton(
                 onPressed: (){
                  Navigator.of(context).pop(false);
                 },child: const Text('No')    
            ),
                TextButton(
                 onPressed: (){
                 Navigator.of(context).pop(true);
                 }, child: const Text('Si, deseo eliminar la pesada')
                
            ),
              ],
            
            );


              },
          );
  }



