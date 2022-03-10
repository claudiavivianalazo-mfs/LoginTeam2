import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final String labelText;
  InputPassword({required this.labelText});

  @override
  State<StatefulWidget> createState() => InputPasswordState(labelText: labelText);
}

class InputPasswordState extends State<InputPassword> {
  final String labelText;
  InputPasswordState({required this.labelText});

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextFormField(
          style: const TextStyle(
            height: 0.1,
            fontSize: 14.0,
            color: Color(0xFF343C46),
          ),
          obscureText: _obscureText,
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
                  _toggle();
                },
                icon:
                    const Icon(Icons.remove_red_eye, color: Color(0xFF8A9BA8))),
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xFF808FA1)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (value) {
            if (value != '') return null;
            return 'Contraseña o número de celular incorrecto';
          },
        ));
  }
}
