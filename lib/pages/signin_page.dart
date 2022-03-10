import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/inputs/input_text.dart';
import '../widgets/inputs/input_password.dart';
import '../widgets/login_scaffold.dart';

class SigninPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SigninState();
}

class _SigninState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

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
    return LoginScaffold(
      cardChild: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 35.0),
                padding: const EdgeInsets.only(top: 30.0),
                child: const Text('Iniciar sesión',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
              Row(
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: InputPassword(labelText: 'Contraseña'),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 15.0),
                child: const Text(
                  'Olvidé mi contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Color(0xFF4C5866)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: const Text('Ingresar'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF363853)),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  onPressed: _signHandler,
                )
              ),
              Container(
                width: double.infinity,
                height: 1,
                margin: const EdgeInsets.only(top: 30.0),
                color: const Color(0xFFBFC7D0),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30.0),
                  child: const Text('¿No tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF4C5866)))),
              Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Crea una cuenta Tigo Money',
                      style: TextStyle(color: Color(0xFF363853)),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Color(0xFF363853))
                              )
                          )
                    ),
                    onPressed: () {},
                  )
                )
            ])
          ),
      ),
    );
  }
}
