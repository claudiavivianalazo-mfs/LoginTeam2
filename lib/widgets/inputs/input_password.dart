import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  final String labelText;
  final Function toggle;
  final bool obscureText;

  InputPassword({required this.labelText, required this.toggle, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextFormField(
          style: const TextStyle(
            height: 0.3,
            fontSize: 14.0,
            color: Color(0xFF343C46),
          ),
          obscureText: obscureText,
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
            suffixIcon: IconButton(
                onPressed: () {
                  toggle();
                },
                icon: const Icon(Icons.remove_red_eye, color: Color(0xFF8A9BA8))
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xFF808FA1)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ));
  }
}
