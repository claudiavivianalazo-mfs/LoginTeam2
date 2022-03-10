import 'package:flutter_modular/flutter_modular.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/signin_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => SigninPage()),
  ];
}
