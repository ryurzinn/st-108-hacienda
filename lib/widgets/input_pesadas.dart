




import 'package:flutter/material.dart';

class InputPesadas extends StatelessWidget {
  final Color fondo;
  final Color linea;
  final TextEditingController controller;
  final String label;
  final String hint;
  final String helperText;
  final String counterText;
  final int length;
  final IconData icon;
  final Color? hintColor;

  const InputPesadas({super.key, 
    required this.controller, 
    required this.fondo, 
    required this.linea, 
    required this.label, 
    required this.hint, 
    required this.helperText, 
    required this.counterText, 
    required this.length, 
    required this.icon,
    this.hintColor
  });



  @override
  Widget build(BuildContext context) { // INDICADOR
    return Column(
      children: [
        TextField(
        
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: length, 
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            fillColor: fondo,
            focusedBorder:   OutlineInputBorder(borderSide: BorderSide(color: linea ),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: linea),
              borderRadius: BorderRadius.circular(15),
            ),
            
            hintText: hint,
        
            hintStyle: const TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
            labelText: label,
            floatingLabelStyle: const TextStyle(color: Colors.black),
            helperText: helperText,
            counterText: counterText,
            suffixIcon: Icon(icon,  size: 20, color: Colors.black45,),
             
          ),    
        ),
        const SizedBox(height: 15),
      ],
    );
  
  }
}