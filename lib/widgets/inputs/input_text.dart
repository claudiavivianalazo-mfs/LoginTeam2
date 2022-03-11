import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String labelText;
  final String preWrittenValue;

  InputText({required this.labelText, this.preWrittenValue = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextFormField(
          initialValue: preWrittenValue,
          style: const TextStyle(
            height: 0.3,
            fontSize: 14.0,
            color: Color(0xFF343C46),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Color(0xFF808FA1))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Color(0xFF808FA1))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Color(0xFFD95A3A))),
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
