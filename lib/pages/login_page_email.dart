import 'package:flutter/material.dart';
import '../widgets/login_scaffold.dart';

class LoginPageEmail extends StatelessWidget {
  const LoginPageEmail({Key? key}) : super(key: key);

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
                top: availableWidth * 0.07,
                right: availableWidth * 0.06,
                bottom: availableWidth * 0.035,
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
                top: availableWidth * 0.035,
                right: availableWidth * 0.05,
                bottom: availableWidth * 0.025,
                left: availableWidth * 0.05),
            child: TextField(
              decoration: InputDecoration(
                hintText: "example@domain.com",
                hintStyle: TextStyle(
                    fontSize: 14 * textScaleFactor,
                    color: const Color.fromRGBO(52, 60, 70, 1)),
                labelText: "Correo Electrónico",
                labelStyle: TextStyle(
                    color: const Color.fromRGBO(54, 56, 83, 1),
                    fontSize: 12 * textScaleFactor),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0.8),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
          Container(
            height: totalHeight * 0.11,
            padding: EdgeInsets.only(
                top: availableWidth * 0.025,
                right: availableWidth * 0.05,
                bottom: availableWidth * 0.025,
                left: availableWidth * 0.05),
          )
        ],
      ),
    );
  }
}
