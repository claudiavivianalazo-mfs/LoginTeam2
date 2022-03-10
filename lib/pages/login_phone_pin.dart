import 'package:flutter/material.dart';
import '../widgets/login_scaffold.dart';

class LoginPhonePinScreen extends StatelessWidget {
  const LoginPhonePinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                children: const [
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(helperText: 'Código País'),
                  )),
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(helperText: 'No. Celular'),
                  ))
                ],
              )),
          Container(
            height: totalHeight * 0.11,
            padding: EdgeInsets.only(
                right: availableWidth * 0.05, left: availableWidth * 0.05),
            child: const TextField(
              decoration: InputDecoration(helperText: 'Pin'),
            ),
          ),
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
              padding: EdgeInsets.only(
                  right: availableWidth * 0.05, left: availableWidth * 0.05),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    minimumSize: const Size.fromHeight(10),
                    primary: Colors.blueGrey),
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
              padding: EdgeInsets.only(
                  right: availableWidth * 0.05, left: availableWidth * 0.05),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    minimumSize: const Size.fromHeight(10),
                    primary: Colors.blueGrey),
                onPressed: () {},
                child: const Text('Crear una cuenta Tigo Money'),
              )),
          Container(
            padding: EdgeInsets.only(
                top: availableWidth * 0.20,
                bottom: availableWidth * 0.05,
                right: availableWidth * 0.05,
                left: availableWidth * 0.05),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Al hacer clic en Ingresar, estás aceptando nuestros Términos y Condiciones",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
