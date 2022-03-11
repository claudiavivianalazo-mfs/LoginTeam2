import 'package:flutter_modular/flutter_modular.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/login_page_email.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/signin_page.dart';

import '../pages/login_phone_pin.dart';
import '../pages/welcome_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => WelcomePage()),
    ChildRoute('/loginEmail', child: (_, args) => LoginPageEmail()),
    ChildRoute('/loginPhonePin', child: (_, args) => LoginPhonePinScreen()),
    ChildRoute('/signin', child: (_, args) => SigninPage()),
  ];
}
