import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet_tigomoney2_0_mobile_login/widgets/button_styles.dart';
import '../widgets/inputs/input_password.dart';
import '../widgets/inputs/input_text.dart';
import '../widgets/login_scaffold.dart';

class LoginPageEmail extends StatefulWidget {
  LoginPageEmail({Key? key}) : super(key: key);

  @override
  State<LoginPageEmail> createState() => _LoginPageEmailState();
}

class _LoginPageEmailState extends State<LoginPageEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String _passwordValue = '';
  void _passwordHandler(String text) {
    setState(() {
      _passwordValue = text;
    });
  }

  void _signHandler() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Got valid input');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final availableWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return LoginScaffold(
      cardChild: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: availableWidth * 0.07,
                  right: availableWidth * 0.06,
                  bottom: availableWidth * 0.035,
                  left: availableWidth * 0.06),
              child: Text(
                "Iniciar sesión",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color.fromRGBO(52, 60, 70, 1),
                    fontSize: (18 * textScaleFactor)),
              ),
            ),
            Container(
              height: totalHeight * 0.11,
              padding: EdgeInsets.only(
                  left: availableWidth * 0.05, right: availableWidth * 0.05),
              child: InputText(
                labelText: 'Correo electroníco',
                isEmail: true,
              ),
            ),
            Container(
              height: totalHeight * 0.11,
              padding: EdgeInsets.only(
                  left: availableWidth * 0.05, right: availableWidth * 0.05),
              child: InputPassword(
                labelText: 'Contraseña',
                passwordHandler: _passwordHandler,
                isEmail: true,
              ),
            ),
            Container(
              height: totalHeight * 0.09,
              padding: EdgeInsets.only(
                  left: availableWidth * 0.05, right: availableWidth * 0.05),
              child: TextButton(
                child: const Text(
                  "Olvidé mi contraseña",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF4C5866),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              height: totalHeight * 0.07,
              padding: EdgeInsets.only(
                left: availableWidth * 0.05,
                right: availableWidth * 0.05,
              ),
              child: ElevatedButton(
                child: const Text("Ingresar"),
                style: elevatedButtonStyle,
                onPressed: _passwordValue.isNotEmpty ? _signHandler : null,
              ),
            ),
            Container(
              width: double.infinity,
              height: totalHeight * 0.002,
              margin: EdgeInsets.only(top: totalHeight * 0.03),
              color: const Color(0xFFBFC7D0),
            ),
            Container(
              width: double.infinity,
              height: totalHeight * 0.09,
              padding: EdgeInsets.only(
                  left: availableWidth * 0.05, right: availableWidth * 0.05),
              child: TextButton(
                child: const Text(
                  "¿No tienes una cuenta?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4C5866),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              height: totalHeight * 0.07,
              padding: EdgeInsets.only(
                  left: availableWidth * 0.05, right: availableWidth * 0.05),
              child: TextButton(
                child: const Text("Crear una cuenta de Tigo money"),
                style: textButtonStyle,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
