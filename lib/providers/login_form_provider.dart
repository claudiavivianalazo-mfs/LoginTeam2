import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> globalKey = new GlobalKey();
  late String email;
  late String password;

  bool isValidForm(){
    return globalKey.currentState?.validate() ?? false;
  }
}