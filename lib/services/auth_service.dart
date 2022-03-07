import 'dart:convert';

import 'package:auth0/auth0.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  var auth0 = Auth0Client(
      domain: "dev-millicom.us.auth0.com",
      clientId: "mJ31bTBPCEKC53dVp4d5gQzaEjtRESkx",
      clientSecret:
          "cns3BrHX0U2hqWbxL3ayl85t8BGL04eymEdSYWl0RLbEQKyXuCtHuHgNsxUUer6h");
  final realm = "Username-Password-Authentication";
  Future<String?> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final response = jsonEncode(
        await auth0.login(email: email, password: password, realm: realm));
    Map<String, dynamic> token = jsonDecode(response);

    if (token["statusCode"].toString().contains("200")) {
      await prefs.setString('token', token["token"]);
      return null;
    } else {
      Map<String, dynamic> error = jsonDecode(token["message"]);
      return error['error_description'];
    }
  }

  Future logout() async {
    final response = await auth0.logout();

    if (response.contains("ok")) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
    }
    return;
  }

  Future<String> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString('token') ?? '';
  }

  Future<String?> resetPassword(String email) async {
    final response =
        jsonEncode(await auth0.resetPassword(email: email, realm: realm));
    Map<String, dynamic> token = jsonDecode(response);

    if (token["statusCode"].toString().contains("200")) {
      return token["message"].toString();
    } else {
      return "Error al procesar el correo";
    }
  }


}
