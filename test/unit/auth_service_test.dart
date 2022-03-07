import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/login_page.dart';
import 'package:wallet_tigomoney2_0_mobile_login/services/auth_service.dart';

void main() {
  test('testvoid', () {});
  final auth_Service = AuthService();

  test('test de auth', () async {
    const realm = "Username-Password-Authentication";
    const email = "user1@example.com";
    const password = "Millicom321*";
    expect(
        auth_Service.auth0
            .login(email: email, password: password, realm: realm)
            .toString(),
        "Instance of 'Future<dynamic>'");
  });

  test('test de LoginOut', () async {
    expect(
        auth_Service.auth0.logout().toString(), "Instance of 'Future<String>'");
  });
}
