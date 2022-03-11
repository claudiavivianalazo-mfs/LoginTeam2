import 'package:flutter/material.dart';
import 'package:wallet_tigomoney2_0_mobile_login/widgets/button_styles.dart';
import 'package:wallet_tigomoney2_0_mobile_login/widgets/inputs/input_password.dart';
import '../widgets/login_scaffold.dart';
import '../widgets/inputs/input_text.dart';

class LoginPhonePinScreen extends StatelessWidget {
  const LoginPhonePinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff363853);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final availableWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;

    return LoginScaffold(
      cardChild: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: availableWidth * 0.035,
                right: availableWidth * 0.06,
                left: availableWidth * 0.06),
            child: Text(
              "Iniciar sesión",
              style: TextStyle(
                  color: const Color.fromRGBO(52, 60, 70, 1),
                  fontSize: (18 * textScaleFactor)),
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
                    child: InputText(labelText: 'Código país'),
                  )),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: InputText(labelText: 'No. Celular'),
                  )),
                ],
              )),
          Container(
              height: totalHeight * 0.11,
              padding: EdgeInsets.only(
                  top: availableWidth * 0.05,
                  right: availableWidth * 0.05,
                  left: availableWidth * 0.05),
              child: InputPassword(labelText: 'Pin')),
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
                onPressed: () {},
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
              child: ElevatedButton(
                style: elevatedButtonStyle,
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
                      decoration: TextDecoration.underline,
                      color: primaryColor)),
            ),
          )
        ],
      ),
    );
  }
}
