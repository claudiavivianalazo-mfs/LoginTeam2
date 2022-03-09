import 'package:flutter_modular/flutter_modular.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/login_page.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/welcome_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/welcome', child: (_, args) => WelcomePage()),
  ];
}
