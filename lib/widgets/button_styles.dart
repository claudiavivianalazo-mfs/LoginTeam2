import 'package:flutter/material.dart';

/// Usage:
///
/// TextButton.icon(
///      style: textButtonStyle,
///      onPressed: () => {},
///      icon: const Icon(
///            Icons.mail,),
///      label: const Text('Iniciar con correo electrónico')),
///
/// You can override TextStyle in your widget:
///
/// ElevatedButton(
///      style: elevatedButtonStyle,
///      onPressed: () => {},
///      label: const Text('Iniciar con correo electrónico',
///           style: TextStyle(fontWeight: FontWeight.normal)),
///      ),
///
///
///

const primaryColor = Color(0xff363853);

ButtonStyle textButtonStyle = TextButton.styleFrom(
  primary: primaryColor,
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

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: primaryColor,
  padding: const EdgeInsets.symmetric(horizontal: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  textStyle: const TextStyle(fontWeight: FontWeight.bold),
);
