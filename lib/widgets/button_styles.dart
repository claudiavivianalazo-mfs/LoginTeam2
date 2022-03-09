import 'package:flutter/material.dart';

/// Example of usage:
/// TextButton.icon(
///      style: textButtonStyle,
///      onPressed: () => {},
///      icon: const Icon(
///            Icons.mail,),
///      label: const Text('Iniciar con correo electrónico')),

const primaryColor = Color(0xff363853);

ButtonStyle textButtonStyle = TextButton.styleFrom(
  primary: primaryColor,
  backgroundColor: Colors.white,
  side: const BorderSide(
    color: primaryColor,
    style: BorderStyle.solid,
  ),
  padding: const EdgeInsets.symmetric(horizontal: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  textStyle: const TextStyle(fontWeight: FontWeight.bold),
);
