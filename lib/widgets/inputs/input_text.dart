// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../services/notifications_service.dart';

class InputText extends StatelessWidget {
  final String labelText;
  bool isEmail;

  final String preWrittenValue;

  InputText(
      {required this.labelText,
      this.preWrittenValue = "",
      this.isEmail = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextFormField(
          initialValue: preWrittenValue,
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
                borderSide:
                    const BorderSide(width: 1, color: Color(0xFFD95A3A))),
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xFF808FA1)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (value) {
            String prueba = "prueba@prueba.com";
            if (value != '') {
              if (isEmail) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? value == prueba
                        ? null
                        : NotificationsService.showSnackBar(
                            'Tu email o password no son correctos, por favor intenta de nuevo')
                    : 'El valor ingresado no es un correo';
              }
              return null;
            }
            return 'Este campo no puede estar vacío';
          },
        ));
  }
}
