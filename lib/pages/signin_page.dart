import 'package:flutter/material.dart';
import '../widgets/inputs/input_text.dart';
import '../widgets/inputs/input_password.dart';

class SigninPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SigninState();
}

class _SigninState extends State<SigninPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 40.0),
              child: const Text('Iniciar sesión', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Row(
              children: [
                Expanded(child: InputText(labelText: 'Código país')),
                Expanded(child: InputText(labelText: 'No. celular'))
              ],
            ),
            InputPassword(
              labelText: 'Contraseña',
              toggle: _toggle,
              obscureText: _obscureText
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: const Text('Olvidé mi contraseña', textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF4C5866)),),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ElevatedButton(
                child: const Text('Ingresar'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  )
                ),
                onPressed: null,
              )
            )
          ],
        ),
      ),
    );
  }
}
