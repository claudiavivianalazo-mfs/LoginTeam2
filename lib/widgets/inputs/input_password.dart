import 'package:flutter/material.dart';
import 'package:wallet_tigomoney2_0_mobile_login/services/notifications_service.dart';

class InputPassword extends StatefulWidget {
  final String labelText;
  final Function? passwordHandler;
  bool isEmail;
  InputPassword(
      {required this.labelText, this.passwordHandler, this.isEmail = false});

  @override
  State<StatefulWidget> createState() => InputPasswordState(
        labelText: labelText,
        passwordHandler: passwordHandler,
        isEmail: isEmail,
      );
}

class InputPasswordState extends State<InputPassword> {
  final String labelText;
  final Function? passwordHandler;
  bool isEmail;
  InputPasswordState(
      {required this.labelText, this.passwordHandler, required this.isEmail});

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
          onChanged: (text) => setState(() {
            passwordHandler != null ? passwordHandler!(text) : null;
          }),
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF343C46),
          ),
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1, color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(width: 1, color: Color(0xFFD95A3A))),
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
            String pass = 'apartamento';
            if (value == pass) return null;
            return isEmail
                ? NotificationsService.showSnackBar(
                    'Tu email o password no son correctos, por favor intenta de nuevo')
                : NotificationsService.showSnackBar(
                    'Contraseña o número de celular incorrecto');
          },
        ));
  }
}
