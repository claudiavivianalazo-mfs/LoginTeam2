import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet_tigomoney2_0_mobile_login/widgets/button_styles.dart';
import 'package:wallet_tigomoney2_0_mobile_login/widgets/inputs/input_password.dart';
import '../widgets/login_scaffold.dart';
import '../widgets/inputs/input_text.dart';

class LoginPhonePinScreen extends StatefulWidget {
  const LoginPhonePinScreen({Key? key}) : super(key: key);

  @override
  State<LoginPhonePinScreen> createState() => _LoginPhonePinScreenState();
}

class _LoginPhonePinScreenState extends State<LoginPhonePinScreen> {
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
    const primaryColor = Color(0xff363853);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final availableWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;

    return LoginScaffold(
        cardChild: Form(
      key: _formKey,
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(
              top: availableWidth * 0.035,
              right: availableWidth * 0.06,
              left: availableWidth * 0.06),
          child: Text(
            "Iniciar sesión",
            style: TextStyle(
                color: const Color.fromRGBO(52, 60, 70, 1),
                fontSize: (18 * textScaleFactor),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            height: totalHeight * 0.11,
            padding: EdgeInsets.only(
                right: availableWidth * 0.05, left: availableWidth * 0.05),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: InputText(
                      labelText: 'Código país', preWrittenValue: '+504'),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: InputText(
                      labelText: 'No. Celular', preWrittenValue: '765301823'),
                )),
              ],
            )),
        Container(
            height: totalHeight * 0.11,
            padding: EdgeInsets.only(
                top: availableWidth * 0.05,
                right: availableWidth * 0.05,
                left: availableWidth * 0.05),
            child: InputPassword(
                labelText: 'Pin',
                autoFocusHint: true,
                passwordHandler: _passwordHandler)),
        Container(
          padding: EdgeInsets.only(
              right: availableWidth * 0.05,
              bottom: availableWidth * 0.05,
              left: availableWidth * 0.05),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Olvidé mi PIN",
            ),
          ),
        ),
        Container(
            height: totalHeight * 0.06,
            width: totalHeight * 0.80,
            padding: EdgeInsets.only(
                right: availableWidth * 0.05, left: availableWidth * 0.05),
            child: ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: _passwordValue.isNotEmpty ? _signHandler : null,
              child: const Text('Ingresar'),
            )),
        Container(
            padding: EdgeInsets.only(
                top: availableWidth * 0.05,
                right: availableWidth * 0.05,
                left: availableWidth * 0.05),
            child: const Divider(
              color: Colors.blueGrey,
            )),
        Container(
          padding: EdgeInsets.only(
              top: availableWidth * 0.05,
              bottom: availableWidth * 0.05,
              right: availableWidth * 0.05,
              left: availableWidth * 0.05),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "¿No tienes una cuenta?",
            ),
          ),
        ),
        Container(
            height: totalHeight * 0.06,
            width: totalHeight * 0.80,
            padding: EdgeInsets.only(
                right: availableWidth * 0.05, left: availableWidth * 0.05),
            child: TextButton(
              style: textButtonStyle,
              onPressed: () {},
              child: const Text('Crear una cuenta Tigo Money'),
            )),
        Container(
          padding: EdgeInsets.only(
              top: availableWidth * 0.270,
              right: availableWidth * 0.05,
              left: availableWidth * 0.05),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Al hacer clic en Ingresar, estás aceptando nuestros",
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              right: availableWidth * 0.05, left: availableWidth * 0.05),
          child: GestureDetector(
            child: const Text("Términos y Condiciones",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: primaryColor)),
          ),
        )
      ]),
    ));
  }
}
