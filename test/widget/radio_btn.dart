import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:wallet_tigomoney2_0_mobile_login/pages/login_page.dart';
import 'package:wallet_tigomoney2_0_mobile_login/providers/login_form_provider.dart';

void main() {
  testWidgets('MyWidget has a radioBtn', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => LoginFormProvider(),
          child: radioBtn(),
        ),
      ),
    ));
    final radioBtnFinder = find.byType(radioBtn);
    final radioBtntext = find.text("Recordarme");
    expect(radioBtnFinder, findsOneWidget);
    expect(radioBtntext, findsOneWidget);
  });
}
