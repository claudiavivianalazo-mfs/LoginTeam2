import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String labelText;

  InputText({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextFormField(
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF343C46),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1, color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1, color: Color(0xFFD95A3A))),
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xFF808FA1)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (value) {
            if (value != '') return null;
            return 'Este campo no puede estar vacío';
          },
        ));
  }
}
