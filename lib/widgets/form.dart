// import 'package:flutter/material.dart';



// class TodosLosFormularios extends StatelessWidget {
//   const TodosLosFormularios({super.key});

//   @override
//   Widget build(BuildContext context) {

//     // final pesadasForm = Provider.of<PesadasFormProvider>(context);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//         children: [
  
//         Container(
//           padding: const EdgeInsets.all(15),
//           child: Center(
//             child: Form(
//               // key: pesadasForm.formKey,
//               child:  TextFormField(
//             keyboardType: TextInputType.number,
//             maxLength: 6,
//             autofocus: true,
//             initialValue: '',
//             textCapitalization: TextCapitalization.words,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 230, 0))),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color.fromARGB(255, 255, 230, 0)),
//               ),
//               hintText: 'Indicador',
//               labelText: 'Colocar el indicador',
//               floatingLabelStyle: TextStyle(color: Colors.black),
//               helperText: 'Sólo números',
//               counterText: '6 caracteres',
//               suffixIcon: Icon(Icons.build_outlined,),
//               border: OutlineInputBorder(         
//                 borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 topRight: Radius.circular(10)
//                 ),
//               ),   
//             ),
//             ),),
//           ), 
//         ),
//       Container(
//         padding: const EdgeInsets.all(15),
//         child: Center(
//           child: Form(
//             // key: pesadasForm.formKey,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: TextFormField(
//           maxLength: 12,
//           autofocus: true,
//           initialValue: '',
//           textCapitalization: TextCapitalization.words,
//           decoration: const InputDecoration(
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.orange),
//             ),
//             hintText: 'Lote',
//             labelText: 'Colocar el Lote',
//             floatingLabelStyle: TextStyle(color: Colors.black),
//             counterText: '12 caracteres',
//             suffixIcon: Icon(Icons.build_outlined),
//             suffixIconColor: Colors.black,
//             iconColor: Colors.black,
//             prefixIconColor: Colors.black,
//             border: OutlineInputBorder(         
//               borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(10),
//               topRight: Radius.circular(10)
//               ),
//             ),
//           ),
//           ),),
//         ),
//       ),


//       Container(
//         padding: const EdgeInsets.all(15),
//         child: Center(
//           child: Form(
//             // key: pesadasForm.formKey,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: TextFormField(
//             maxLength: 4,
//             autofocus: true,
//             initialValue: '',
//             textCapitalization: TextCapitalization.words,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 253, 17, 0))),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color.fromARGB(255, 253, 17, 0)),
//               ),
//               hintText: 'Estado',
//               labelText: 'Colocar el Estado',
//               floatingLabelStyle: TextStyle(color: Colors.black),
//               counterText: '4 caracteres',
//               suffixIcon: Icon(Icons.build_outlined),
//               suffixIconColor: Colors.black,
//               iconColor: Colors.black,
//               prefixIconColor: Colors.black,
//               border: OutlineInputBorder(         
//                 borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 topRight: Radius.circular(10)
//                 ),
//               ),
//             ),
//             ),),
//         ),
//       ),

//         Container(
//           padding: const EdgeInsets.all(15),
//           child: Center(
//             child: Form(
//               // key: pesadasForm.formKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: TextFormField(
//             maxLength: 22,
//             autofocus: true,
//             initialValue: '',
//             textCapitalization: TextCapitalization.words,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 28, 153, 3))),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color.fromARGB(255, 28, 153, 3)),
//               ),
//               hintText: 'Caravana',
//               labelText: 'Colocar la Caravana',
//               floatingLabelStyle: TextStyle(color: Colors.black),
//               counterText: '22 caracteres',
//               suffixIcon: Icon(Icons.build_outlined),
//               suffixIconColor: Colors.black,
//               iconColor: Colors.black,
//               prefixIconColor: Colors.black,
//               border: OutlineInputBorder(         
//                 borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 topRight: Radius.circular(10)
//                 ),
//               ),
//             ),
//             ),),
//           ),
//         ),  
//       ]),
//     ));
//   }
// }


   









// // Widget crearInputIndicador() { // AMARILLO

// //   return Container(
// //     padding: const EdgeInsets.all(15),
// //     child: Center(
// //       child: Form(

// //         // key: ,
// //         autovalidateMode: AutovalidateMode.onUserInteraction,

// //         child: TextFormField(
// //         keyboardType: TextInputType.number,
// //         maxLength: 6,
// //         autofocus: true,
// //         initialValue: '',
// //         textCapitalization: TextCapitalization.words,
// //         decoration: const InputDecoration(
// //           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 230, 0))),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color.fromARGB(255, 255, 230, 0)),
// //           ),
// //           hintText: 'Indicador',
// //           labelText: 'Colocar el indicador',
// //           floatingLabelStyle: TextStyle(color: Colors.black),
// //           helperText: 'Sólo números',
// //           counterText: '6 caracteres',
// //           suffixIcon: Icon(Icons.build_outlined,),
// //           border: OutlineInputBorder(         
// //             borderRadius: BorderRadius.only(
// //             bottomLeft: Radius.circular(10),
// //             topRight: Radius.circular(10)
// //             ),
// //           ),  
// //         ),
// //         ),    
// //       ),

// //   ));
// //   }
// //  Widget crearInputLote() { // LOTE

// //   return Container(
// //     padding: const EdgeInsets.all(15),
// //     child: Form(
// //       child: TextFormField(
// //       maxLength: 12,
// //       autofocus: true,
// //       initialValue: '',
// //       textCapitalization: TextCapitalization.words,
// //       decoration: const InputDecoration(
// //         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
// //         focusedBorder: OutlineInputBorder(
// //           borderSide: BorderSide(color: Colors.orange),
// //         ),
// //         hintText: 'Lote',
// //         labelText: 'Colocar el Lote',
// //         floatingLabelStyle: TextStyle(color: Colors.black),
// //         counterText: '12 caracteres',
// //         suffixIcon: Icon(Icons.build_outlined),
// //         suffixIconColor: Colors.black,
// //         iconColor: Colors.black,
// //         prefixIconColor: Colors.black,
// //         border: OutlineInputBorder(         
// //           borderRadius: BorderRadius.only(
// //           bottomLeft: Radius.circular(10),
// //           topRight: Radius.circular(10)
// //           ),
// //         ),
// //       ),
// //       ),
// //     ),
    
// //   );
// //   }
// //  Widget crearInputEstado() { // ESTADO

// //   return Container(
// //     padding: const EdgeInsets.all(15),
// //     child: Form(
// //       child: TextFormField(
// //         maxLength: 4,
// //         autofocus: true,
// //         initialValue: '',
// //         textCapitalization: TextCapitalization.words,
// //         decoration: const InputDecoration(
// //           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 253, 17, 0))),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color.fromARGB(255, 253, 17, 0)),
// //           ),
// //           hintText: 'Estado',
// //           labelText: 'Colocar el Estado',
// //           floatingLabelStyle: TextStyle(color: Colors.black),
// //           counterText: '4 caracteres',
// //           suffixIcon: Icon(Icons.build_outlined),
// //           suffixIconColor: Colors.black,
// //           iconColor: Colors.black,
// //           prefixIconColor: Colors.black,
// //           border: OutlineInputBorder(         
// //             borderRadius: BorderRadius.only(
// //             bottomLeft: Radius.circular(10),
// //             topRight: Radius.circular(10)
// //             ),
// //           ),
          
          
// //         ),
// //         ),
// //     ),
// //   );
// //   }
// //  Widget crearInputCaravana() { // CARAVANA

// //   return Container(
// //     padding: const EdgeInsets.all(10),
// //     child: Form(
// //       child: TextFormField(
// //         maxLength: 22,
// //         autofocus: true,
// //         initialValue: '',
// //         textCapitalization: TextCapitalization.words,
// //         decoration: const InputDecoration(
// //           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 28, 153, 3))),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Color.fromARGB(255, 28, 153, 3)),
// //           ),
// //           hintText: 'Caravana',
// //           labelText: 'Colocar la Caravana',
// //           floatingLabelStyle: TextStyle(color: Colors.black),
// //           counterText: '22 caracteres',
// //           suffixIcon: Icon(Icons.build_outlined),
// //           suffixIconColor: Colors.black,
// //           iconColor: Colors.black,
// //           prefixIconColor: Colors.black,
// //           border: OutlineInputBorder(         
// //             borderRadius: BorderRadius.only(
// //             bottomLeft: Radius.circular(10),
// //             topRight: Radius.circular(10)
// //             ),
// //           ),
          
          
// //         ),
// //         ),
// //     ),
// //   );
// //   }
    
  



